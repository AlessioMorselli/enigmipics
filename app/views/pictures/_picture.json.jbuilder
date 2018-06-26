json.extract! picture, :id, :url, :name, :created_at, :updated_at
json.url picture_url(picture, format: :json)
