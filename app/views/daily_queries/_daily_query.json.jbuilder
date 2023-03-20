json.extract! daily_query, :id, :title, :user_id, :created_at, :updated_at
json.url daily_query_url(daily_query, format: :json)
