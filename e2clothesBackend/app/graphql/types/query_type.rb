module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :me, Types::MyTypes::UserType, null: true

    field :users, [Types::MyTypes::UserType], null: true
    field :user, Types::MyTypes::UserType, null: true do
      argument :id, ID, required: true
    end

    field :search, Types::MyTypes::SearchType, null: true do
      argument :search, String, required: true
      argument :page, Integer, required: false
      argument :limit, Integer, 'set items per page' ,required: false
    end

    field :product, Types::MyTypes::ProductType, null: true do
      argument :id, ID, required: true
    end

    field :recommend, [Types::MyTypes::ProductType], null: true do
      argument :range, Integer, required: false
    end

    field :order, Types::MyTypes::OrderType, null: true do
      argument :id, ID, required: true
    end

    field :shop, Types::MyTypes::ShopType, null: true do
      argument :id, ID, required: true
    end

    def me
      raise GraphQL::ExecutionError,"Authorization Token is required " if context[:me].nil?
      context[:me]
    end

    def shop(id:)
      Shop.find id
    end

    def users
      User.all
    end

    def user(id:)
      User.find(id)
    end

    def order(id:)
      Order.find(id)
    end

    def product(id:)
      Product.find(id)
    end

    def recommend(range: 6)
      Product.all.sample(range)
    end

    # Pagiation
    def search(params)
      p = Product.search(params[:search])
      total = p.count
      p = p.paginate(page: params[:page], per_page: params[:limit] ||= 6) if params[:page].present?
      if p.size > 0
        {products: p, page: params[:page], per: params[:limit] ||= 6, total: total }
      else
        []
      end
    end
  end
end
