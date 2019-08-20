json.extract! product, :id, :name, :description, :price, :status, :image_url, :discount, :type_id, :created_at, :updated_at
json.url product_url(product, format: :json)
