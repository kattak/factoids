json.extract! factoid, :id, :text, :url, :created_at, :updated_at
json.url factoid_url(factoid, format: :json)
