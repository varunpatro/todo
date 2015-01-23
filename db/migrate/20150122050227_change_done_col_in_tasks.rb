class ChangeDoneColInTasks < ActiveRecord::Migration
  def change
  	rename_column :tasks, :done?, :isDone
  end
end
