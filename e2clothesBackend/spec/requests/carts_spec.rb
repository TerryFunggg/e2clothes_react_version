require 'rails_helper'

RSpec.describe 'Carts', type: :request do
  let!(:carts) { create_list(:cart, 5) }
  let(:cart_id) { carts.first.id }
  describe 'GET /carts' do
    # make http GET request before example
    before { get '/api/carts' }
    it 'return carts' do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /carts/:id' do
    before { get "/api/carts/#{cart_id}" }

    context 'when the record exists' do
      it 'returns the cart' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(cart_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does exist' do
      let(:cart_id) { 10 }

      it 'retruns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns cart not found message' do
        expect(response.body).to match("{\"message\":\"Couldn't find Cart with 'id'=10\"}")
      end
    end
  end

  describe 'POST /carts' do
    # valid payload
    let(:product) { create(:product) }
    let(:user) { create(:user) }
    let(:valid_attr) { JSON.parse(build(:cart, product_id: product.id, user_id: user.id).to_json) }

    context 'when the record valid' do
      before { post '/api/carts', params: valid_attr }

      it 'create a cart' do
        expect(json['product_id']).to eq(product.id)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/carts', params: { city: 'Mary' } }

      it 'retruns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed/)
      end
    end
  end

  describe 'DELETE carts/:id' do
    before do
      cart = create(:cart)
      delete "/api/carts/#{cart.id}"
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
