# for testing
if Rails.env.development? && !(ENV['JWT_TOKEN']).to_s.empty?
  p ENV['JWT_TOKEN']
  GraphiQL::Rails.config.headers['Authorization'] = lambda { |_ctx|
    "#{ENV['JWT_TOKEN']}"
  }
end
