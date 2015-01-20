class DeleteRedundantColsFromTasks < ActiveRecord::Migration
  def change
  	remove_column :tasks, :done_status, :boolean
  	remove_column :tasks, :archive_status, :boolean
  end
end
