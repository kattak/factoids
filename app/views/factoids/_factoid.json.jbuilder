json.extract! factoid, :id, :text, :created_at, :updated_at
json.url factoid_url(factoid, format: :json)