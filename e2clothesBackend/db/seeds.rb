200.times do
  user = User.new(
    email: Faker::Internet.email,
    firstName: Faker::Name.first_name,
    lastName: Faker::Name.last_name,
    userName: Faker::FunnyName.name,
    isActive: Faker::Boolean.boolean,
    phone: Faker::PhoneNumber.subscriber_number(length: 8),
    role: %w[buyer seller admin].sample.to_s,
    avatar: Faker::Avatar.image(slug: 'my-own-slug')
  )
  user.password = Faker::Internet.password(min_length: 8, max_length: 15)
  user.save!
end

100.times do
  Address.create(
    city: Faker::Address.city,
    buildingAddress: Faker::Address.building_number,
    streetAddress: Faker::Address.street_address,
    zipCode: Faker::Address.zip_code
  )
end

20.times do |index|
  Shop.create(
    title: Faker::Company.name,
    state: %w[is_open unqualified is_close].sample.to_s,
    address: Address.find(index + 1),
    user: User.where('isActive', true)[index + 1]
  )
end

50.times do |_index|
  Product.create(
    name: Faker::Coffee.blend_name,
    price: Faker::Number.between(from: 1.0, to: 500.0).round(1),
    quality: Faker::Number.between(from: 1, to: 50),
    shop_id: rand(0..20),
    isActive: true
  )
end
