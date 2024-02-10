class RenameUserIdToAuthorIdInUserTransactions < ActiveRecord::Migration[7.1]
  def change
    rename_column :user_transactions, :user_id, :author_id
  end
end
