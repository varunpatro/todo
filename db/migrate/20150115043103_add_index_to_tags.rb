class AddIndexToTags < ActiveRecord::Migration
  def change
  	add_index :tags, [:task_id, :created_at]
  end
end
