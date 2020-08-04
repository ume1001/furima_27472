class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
    @item = Item.all
  end

  def new
    @item = Item.new
    # @item = Item.new(params[:keyword])
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    # @user = User.find(params[:id])
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path # id: current_user.id
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
  end

  def show
    @item = Item.find(params[:id])
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
