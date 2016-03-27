class ItemsController < ApplicationController
  before_action :set_item, only: [ :destroy]

  def index
    @items = Item.all
  end

  def new
    @items = Item.where(:list_id => params[:id])
    @item = Item.new
    @item.list_id = params[:id]
    @list = List.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    respond_to do |format|
      if @item.save
        @listId = @item.list_id;
        format.html { redirect_to list_path(@listId)  }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end



  def destroy
    @listId = @item.list_id;
    @item.destroy
    respond_to do |format|
      format.html { redirect_to list_path(@listId) , notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :priority, :list_id)
    end
end
