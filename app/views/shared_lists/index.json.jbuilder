json.array!(@shared_lists) do |shared_list|
  json.extract! shared_list, :id, :user_id, :friend_id, :list_id
  json.url shared_list_url(shared_list, format: :json)
end
