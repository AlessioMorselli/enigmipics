json.extract! saved_picture, :id, :description, :created_at, :updated_at
json.url saved_picture_url(saved_picture, format: :json)
