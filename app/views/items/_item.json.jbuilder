json.extract! item, :id, :name, :price, :release_date, :discription, :created_at, :updated_at
json.url item_url(item, format: :json)
