json.array!(@stages) do |stage|
  json.extract! stage, :id, :current_project_stage
  json.url stage_url(stage, format: :json)
end
