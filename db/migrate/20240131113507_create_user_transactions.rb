class CreateUserTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :user_transactions do |t|
      t.references :user, foreign_key: true, index: true, null: false
      t.string :name
      t.decimal :amount
      t.references :group, foreign_key: true, index: true, null: false
      t.timestamp :created_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
