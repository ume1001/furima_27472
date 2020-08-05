class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :update, :edit]
  before_action :find_item, only: :purchase

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
  end

  def show
  end

  def purchase
    @items_purchaser = Item.find(params[:id])
    @items_purchaser.update(purchase_id: current_user.id)
  end

  private

  def item_params
    params.require(:item).permit(
      :image,
      :name,
      :text,
      :category_id,
      :status_id,
      :deliveryFee_id,
      :area_id,
      :deliveryTime_id,
      :price,
      :purchase_id
    ).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def find_item
    @item = Item.find(params[:id]) # 購入する商品を特定
  end
end
