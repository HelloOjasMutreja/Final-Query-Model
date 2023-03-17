json.extract! query, :id, :question, :created_at, :updated_at
json.url query_url(query, format: :json)
