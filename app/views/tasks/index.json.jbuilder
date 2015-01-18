json.array!(@tasks) do |task|
  json.extract! task, :id, :name, :list_id
  json.url task_url(task, format: :json)
end
