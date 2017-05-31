class ItemsController < ApplicationController

before_action :find_item, only: [:show, :destroy]
before_action :authenticate_user!, only: [:new, :create, :destroy]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def show
    @user = @item.user
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  def destroy
    @item.destroy
    redirect_to item_path
  end

  private

  def find_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :price, :photo, :photo_cache)
  end
end
