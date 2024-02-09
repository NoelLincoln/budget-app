# app/controllers/categories_controller.rb
class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @total_amount = @category.user_transactions.sum(:amount)
    @transactions = @category.user_transactions.includes(:author, :category).order(created_at: :desc)
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.build(category_params)

    if @category.save
      redirect_to categories_path, notice: 'Category was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
