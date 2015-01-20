module TasksHelper
	def create_multiple_tags( _tags, _task_id )
		wo_spaces = _tags.gsub(" ", "")
		tags_arr = wo_spaces.split(',')
		tags_arr.each do |t|
			Tag.create(name: t, task_id: _task_id)
		end
	end

	def lname_to_lid( lname )
		lists = List.where(name: lname)
		if (lists.count > 0) then
			return lists.first.id
		end
	end
end
