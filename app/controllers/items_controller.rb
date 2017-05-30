class ItemsController < ApplicationController

before_action :find_item, only: [:show, :destroy]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def show
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to item_path(@item)
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
