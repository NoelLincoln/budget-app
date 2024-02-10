class UserTransactionsController < ApplicationController
  before_action :find_category, only: [:index]

  def index
    @user_transactions = if params[:category_id]
                           @category.user_transactions.includes(:author, :category).order(created_at: :desc)
                         else
                           current_user.categories.joins(:user_transactions).order('user_transactions.created_at DESC')
                             .select('user_transactions.*, categories.name as category_name')
                         end
    @total_amount = @user_transactions.sum(:amount)
  end

  def new
    @user_transaction = UserTransaction.new
    @categories = current_user.categories.includes(:user_transactions)
    @user_transaction.category = Category.find(params[:category_id]) if params[:category_id].present?
  end

  def create
    @user_transaction = UserTransaction.new(user_transaction_params)
    @user_transaction.author = current_user

    if @user_transaction.save
      redirect_to category_user_transactions_path(@user_transaction.category),
                  notice: 'User Transaction was successfully created.'
    else
      @categories = Category.all
      render :new, status: :unprocessable_entity
    end
  end

  private

  def find_category
    @category = Category.find(params[:category_id])
  end

  def user_transaction_params
    params.require(:user_transaction).permit(:name, :amount, :category_id)
  end
end
