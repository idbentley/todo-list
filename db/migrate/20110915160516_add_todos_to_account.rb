class AddTodosToAccount < ActiveRecord::Migration
  def self.up
    add_column :todos, :account_id, :integer
  end

  def self.down
    remove_column :todos, :account_id
  end
end
