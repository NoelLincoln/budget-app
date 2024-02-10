class RemoveIconFromCategories < ActiveRecord::Migration[6.0]
  def change
    remove_column :categories, :icon, :string
  end
end
