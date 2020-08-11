class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :find_item, only: [:show, :edit, :update, :destroy, :purchase]
  before_action :move_to_index_item, only: [:purchase_confirmation]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @items = Item.new
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @items = Item.new(item_params)
    if @items.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @items.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    if @items.destroy
      redirect_to root_path
    else
      render :new
    end
  end

  def purchase_confirmation
    @items = Item.find(params[:item_id]) # 指定した商品の購入画面が表示される
  end

  def purchase
    # Save Purchese
    @purchase = Purchase.new(user_id: current_user.id, item_id: params[:id])
    # Save Address
    @address = ItemPurchase.new(address_params)

    # 以下をじっこうする
    pay_item
    # @purchaseと@addressをほぞんしていく
    if @purchase.valid?
      @address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :image,
      :name,
      :text,
      :category_id,
      :status_id,
      :deliveryfee_id,
      :area_id,
      :deliverytime_id,
      :price,
      :purchase_id
    ).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def find_item
    @items = Item.find(params[:id]) # 購入する商品を特定
  end

  def purchase_params
    params.permit(:price, :token)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      # @itemsのpriceをもってくる
      amount: @items.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def address_params
    params.permit(
      :image,
      :name,
      :text,
      :category_id,
      :status_id,
      :deliveryfee_id,
      :area_id,
      :deliverytime_id,
      :price,
      :postal_code,
      :area_id,
      :prefectures,
      :city,
      :building,
      :phone,
      :item_id
    ).merge(user_id: current_user.id, item_id: params[:id])
  end

  def move_to_index_item
    @items = Item.find(params[:item_id])
    return redirect_to root_path if user_signed_in? && current_user.id == @items.user.id
  end
end
