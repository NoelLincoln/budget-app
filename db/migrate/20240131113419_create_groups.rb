class CreateGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :groups do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :icon
      t.timestamp :created_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
