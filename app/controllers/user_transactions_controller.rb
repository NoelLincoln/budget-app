# app/controllers/user_transactions_controller.rb
class UserTransactionsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @user_transactions = @category.user_transactions
  end

  def new
    @category = Category.find(params[:category_id])
    @user_transaction = @category.user_transactions.build
  end

  def create
    @category = Category.find(params[:category_id])
    @user_transaction = @category.user_transactions.build(user_transaction_params)
    if @user_transaction.save
      redirect_to category_user_transactions_path(@category), notice: 'User Transaction was successfully created.'
    else
      render :new
    end
  end

  private

  def user_transaction_params
    params.require(:user_transaction).permit(:amount, :description)
  end
end
