json.array!(@needies) do |needy|
  json.address needy.address
  json.latitude needy.latitude
  json.longitude needy.longitude
  json.name needy.name
  json.quantity_person needy.quantity_person
  json.description needy.description
  json.categories needy.categories do |category|
    json.name category.name
  end
end