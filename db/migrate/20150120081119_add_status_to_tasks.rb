class AddStatusToTasks < ActiveRecord::Migration
  def change
  	add_column :tasks, :isDone, :boolean, default: false
  end
end
