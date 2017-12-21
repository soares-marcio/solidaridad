json.array!(@needies) do |needy|
  json.address needy.address
  json.latitude needy.latitude
  json.longitude needy.longitude
end