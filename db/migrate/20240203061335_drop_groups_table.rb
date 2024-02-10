class DropGroupsTable < ActiveRecord::Migration[6.0]
  def up
    drop_table :groups, force: :cascade
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
