require 'rails_helper'

RSpec.describe 'OrderProducts', type: :request do
  let!(:ops) { create_list(:order_product, 5) }
  let(:op_id) { ops.first.id }
  describe 'GET /orders' do
    # make http GET request before example
    before { get '/api/order_products' }
    it 'return order_products' do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /order_products/:id' do
    before { get "/api/order_products/#{op_id}" }

    context 'when the record exists' do
      it 'returns the or' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(op_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does exist' do
      let(:op_id) { 10 }

      it 'retruns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns or not found message' do
        expect(response.body).to match("{\"message\":\"Couldn't find OrderProduct with 'id'=10\"}")
      end
    end
  end

  describe 'POST /order_products' do
    # valid payload
    let(:order) { create(:order) }
    let(:product) { create(:product) }
    let(:valid_attr) { JSON.parse(build(:order_product, order_id: order.id, product_id: product.id).to_json) }

    context 'when the record valid' do
      before { post '/api/order_products', params: valid_attr }

      it 'create a order_products' do
        expect(json['product_id']).to eq(product.id)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/order_products', params: { price: '10' } }

      it 'retruns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed/)
      end
    end
  end

  describe 'PUT /order_products/:id' do
    let(:valid_attr) { { name: 'test' } }

    context 'when the record exists' do
      before { put "/api/order_products/#{op_id}", params: valid_attr }

      it 'updates a record' do
        expect(response.body).to be_empty
      end

      it 'updates status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE order_products/:id' do
    before do
      order_products = create(:order_product)
      delete "/api/order_products/#{order_products.id}"
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
