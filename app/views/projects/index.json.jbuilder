json.array!(@projects) do |project|
  json.extract! project, :id, :title, :date, :description, :location
  json.url project_url(project, format: :json)
end
