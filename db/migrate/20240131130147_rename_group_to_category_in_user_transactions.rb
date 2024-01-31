class RenameGroupToCategoryInUserTransactions < ActiveRecord::Migration[7.1]
  def change
    rename_column :user_transactions, :group_id, :category_id
  end
end
