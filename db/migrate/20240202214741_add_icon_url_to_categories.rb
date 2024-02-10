class AddIconUrlToCategories < ActiveRecord::Migration[7.1]
  def change
    add_column :categories, :icon_url, :string
  end
end
