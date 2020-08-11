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
    # binding.pry
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
    # @purchase = Purchase.new(price: purchase_params[:price])
    @items = Item.find(params[:item_id]) # 指定した商品の購入画面が表示される
    # @address = Address.new
  end

  def purchase
    # @items
    # Save Purchese
    @purchase = Purchase.new(user_id: current_user.id, item_id: params[:id])
    # @purchase = Purchase.new[:item]
    # Save Address
    @address = ItemPurchase.new(address_params)
    # binding.pry
    # @address = ItemPurchase.new(params.permit(:postal_code, :area_id, :city, :prefectures, :building, :phone, :item_id))
    # PUrchse Item at Payjp (pay_item?)

    # 以下をじっこうする
    pay_item
    # @purchaseと@addressをほぞんしていく
    # binding.pry
    if @purchase.valid?
      # @purchase.save
      @address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def item_params
    # binding.pry
    # params.permit(
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
    # binding.pry
    # params.require(:price, :token).permit(params[:id])
    params.permit(:price, :token)
  end

  def pay_item
    # binding.pry
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    # customer_token = current_user.purchase.customer_token
    Payjp::Charge.create(
      # @itemｓのpriceをもってくる
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
      #:purchase_id,
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
