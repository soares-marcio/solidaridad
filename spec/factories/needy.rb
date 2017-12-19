FactoryBot.define do
  factory :needy do
    name {FFaker::Lorem.word}
    address {FFaker::AddressBR.full_address}
    latitude {FFaker::Geolocation.lat}
    longitude {FFaker::Geolocation.lng}
    description {FFaker::Lorem.phrase}
    quantity_person {FFaker::Random.rand(100)}
  end
end