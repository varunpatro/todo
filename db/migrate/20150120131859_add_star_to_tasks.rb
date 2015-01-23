class AddStarToTasks < ActiveRecord::Migration
  def change
  	add_column :tasks, :isStarred, :boolean, default: false
  end
end
