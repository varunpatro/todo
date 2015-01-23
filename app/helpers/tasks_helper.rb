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

  def task_stat_helper( params )
  	# this helper is no longer needed
    task_stats = {}

    task_stats["isDone"] = params['isDone'].present?
    task_stats["isStarred"] = params['isStarred'].present?
    task_stats["isArchived"] = params['isArchived'].present?

    return task_stats
  end

  def search_helper( params )
    search_query = {}

    if params["isDone"].present?
      search_query["isDone"] = true 
    end
    
    if params["isStarred"].present?
      search_query["isStarred"] = true 
    end

    if params["isArchived"].present?
      search_query["isArchived"] = true
    end


    if params["tagSearch"].present?
      tag = params["tag"].gsub(" ", "")
      return Task.where(search_query).joins(:tags).where('tags.name = ?', tag)
    else
      session[:no] = search_query
      return Task.where(search_query)
    end

    return Task.where(search_query)

  end

end
