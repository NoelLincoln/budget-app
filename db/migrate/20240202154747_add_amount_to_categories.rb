class AddAmountToCategories < ActiveRecord::Migration[7.1]
  def change
    add_column :categories, :amount, :decimal
  end
end
