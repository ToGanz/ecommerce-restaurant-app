json.extract! product, :id, :name, :description, :price, :vegetarian, :vegan, :available, :featured, :created_at, :updated_at
json.url product_url(product, format: :json)
