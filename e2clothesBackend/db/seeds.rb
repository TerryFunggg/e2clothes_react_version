200.times do
  User.create(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    user_name: Faker::FunnyName.name,
    is_active: Faker::Boolean.boolean,
    password: Faker::Internet.password(min_length: 8, max_length: 15),
    phone: Faker::PhoneNumber.subscriber_number(length: 8),
    role: %w[buyer seller admin].sample.to_s,
    avatar: Faker::Avatar.image(slug: 'my-own-slug')
  )
end

100.times do
  Address.create(
    city: Faker::Address.city,
    building_address: Faker::Address.building_number,
    street_address: Faker::Address.street_address,
    zip_code: Faker::Address.zip_code
  )
end

20.times do |index|
  Shop.create(
    title: Faker::Company.name,
    state: %w[is_open unqualified is_close].sample.to_s,
    address: Address.find(index + 1),
    user: User.where('is_active', true)[index + 1]
  )
end

50.times do |_index|
  Product.create(
    name: Faker::Coffee.blend_name,
    price: Faker::Number.between(from: 1.0, to: 500.0),
    quality: Faker::Number.between(from: 1, to: 50),
    shop_id: rand(0..20),
    is_active: true
  )
end
