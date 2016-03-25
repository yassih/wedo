class CategoriesController < ApplicationController
  before_action :set_category, only: [:destroy]

  def index
    @categories = Category.all
    @lists = List.all
  end

  def new
    @category = Category.new
    @list = List.new
  end


  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_url }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name)
    end
end
