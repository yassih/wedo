json.array!(@items) do |item|
  json.extract! item, :id, :name, :quantity, :date_completed, :priority
  json.url item_url(item, format: :json)
end
