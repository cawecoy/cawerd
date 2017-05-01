json.extract! page, :id, :title, :url, :access_at, :uid, :user_id, :created_at, :updated_at
json.url page_url(page, format: :json)
