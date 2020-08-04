class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :update, :edit]

  def index
    @item = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
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
      :price
    ).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
