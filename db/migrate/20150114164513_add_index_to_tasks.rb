class AddIndexToTasks < ActiveRecord::Migration
  def change
  	add_index :tasks, [:list_id, :created_at]
  end
end
