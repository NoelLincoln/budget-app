# app/controllers/categories_controller.rb
class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @total_amount = @category.user_transactions.sum(:amount)
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.build(category_params)
    attach_icon_to_category

    if @category.save
      redirect_to categories_path, notice: 'Category was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def attach_icon_to_category
    return unless params[:category][:icon].present?

    @category.icon.attach(params[:category][:icon])

    # Set the virtual attribute for displaying purposes
    @category.icon_url = @category.icon.url if @category.icon.attached?
  end

  def category_params
    params.require(:category).permit(:name, :icon, :amount)
  end
end
