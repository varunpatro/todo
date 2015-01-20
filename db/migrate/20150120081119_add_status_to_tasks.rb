class AddStatusToTasks < ActiveRecord::Migration
  def change
  	add_column :tasks, :done_status, :boolean, default: false
  end
end
