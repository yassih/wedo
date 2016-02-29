json.array!(@lists) do |list|
  json.extract! list, :id, :name, :date_completed, :due_date
  json.url list_url(list, format: :json)
end
