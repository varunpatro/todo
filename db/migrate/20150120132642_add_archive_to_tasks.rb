class AddArchiveToTasks < ActiveRecord::Migration
  def change
  	add_column :tasks, :isArchived, :boolean, default: false
  end
end
