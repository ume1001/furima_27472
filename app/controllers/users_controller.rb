class UsersController < ApplicationController
  # before_action :move_to_index, except: [:index]

  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    params.create(user_params)
  end

  def destroy
  end

  def edit
  end

  def update
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :email)
  end

  # def move_to_index
  # unless user_signed_in?
  # redirect_to action: :index
  # end
  # end
end
