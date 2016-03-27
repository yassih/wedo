class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index]


  def index
    @lists = List.where(:user_id => current_user.id)

      if(current_user)
      @shared_lists = SharedList.all
      #where(friend_id: current_user.id).map(&:list)
      # @filtered_list = SharedList.where(list_id: @lists.id)
      end
    #@items = Item.all
  end

  def show

    @items = Item.where(:list_id => params[:id])
    @item = Item.new
    @item.list_id = @list.id

  end


  def new
    @list = List.new
    @item = Item.new
    @item.list_id = @list.id
    @categories = Category.all
  end

  def edit
    @categories = Category.all
    @items = Item.where(:list_id => params[:id])
  end


  def create
    @list = List.new(list_params)

    respond_to do |format| 
      if @list.save
        format.html { redirect_to :action=>"new", :controller=>"items", :notice=>"Success", id: @list.to_param}
      else
        format.html { render :new }
      end
    end
  end


  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: 'List was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @shared_lists = SharedList.all
    @list.destroy
    @list.items.each do |item|
        item.destroy
      end
    @shared_lists.each do |shared|
      if shared.list_id == @list.id
        shared.destroy
      end
    end
    respond_to do |format|
      format.html { redirect_to lists_url, notice: 'List was successfully destroyed.' }
    end
  end

  private

    def set_list
      @list = List.find(params[:id])
    end

    def list_params
      params.require(:list).permit(:name, :due_date, :category_id, :user_id)
    end
end
