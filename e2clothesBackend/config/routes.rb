Rails.application.routes.draw do
  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: 'graphql#execute' if Rails.env.development?
  post '/graphql', to: 'graphql#execute'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/login', to: 'authentication#authenticate'
  post '/signup', to: 'users#signup'
  post '/me', to: 'users#me'
  get '/dashboard/home', to: 'dashboard#index'
  resource :api do
    resources :users, :addresses, :carts, :rates, :traffics
    resources :orders, :order_products
    resources :products, :product_pictures, :categories
    resources :shops, :shop_stuffs
  end
end
