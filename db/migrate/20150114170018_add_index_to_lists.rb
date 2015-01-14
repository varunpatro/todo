class AddIndexToLists < ActiveRecord::Migration
  def change
  	add_index :lists, [:user_id, :created_at]
  end
end
