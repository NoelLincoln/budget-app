class ChangeIconToBeTextInCategories < ActiveRecord::Migration[6.0]
  def up
    change_column :categories, :icon, :text
  end

  def down
    change_column :categories, :icon, :string
  end
end
