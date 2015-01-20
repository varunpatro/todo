class AddStarToTasks < ActiveRecord::Migration
  def change
  	add_column :tasks, :starred?, :boolean, default: false
  end
end
