json.array!(@needies) do |needy|
  json.adress needy.address
  json.latitude needy.latitude
  json.longitude needy.longitude
end