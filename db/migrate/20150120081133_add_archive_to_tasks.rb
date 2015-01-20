class AddArchiveToTasks < ActiveRecord::Migration
  def change
  	add_column :tasks, :archive_status, :boolean, default: false
  end
end
