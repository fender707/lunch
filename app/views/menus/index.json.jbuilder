json.array!(@menus) do |menu|
  json.extract! menu, :id, :title, :category_id, :image_url, :description, :price
  json.url menu_url(menu, format: :json)
end
