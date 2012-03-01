class AddLockedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :locked, :boolean, default: true, null: false

  end
end
