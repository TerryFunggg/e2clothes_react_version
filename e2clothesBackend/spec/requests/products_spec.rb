require 'rails_helper'

RSpec.describe 'Products', type: :request do
  let!(:products) { create_list(:product, 5) }
  let(:product_id) { products.first.id }
  describe 'GET /products' do
    # make http GET request before example
    before { get '/api/products' }
    it 'return products' do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /products/:id' do
    before { get "/api/products/#{product_id}" }

    context 'when the record exists' do
      it 'returns the product' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(product_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does exist' do
      let(:product_id) { 10 }

      it 'retruns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns product not found message' do
        expect(response.body).to match("{\"message\":\"Couldn't find Product with 'id'=10\"}")
      end
    end
  end

  describe 'POST /products' do
    # valid payload
    let(:shop) { create(:shop) }
    let(:valid_attr) { JSON.parse(build(:product, shop_id: shop.id).to_json) }

    context 'when the record valid' do
      before { post '/api/products', params: valid_attr }

      it 'create a products' do
        expect(json['shop_id']).to eq(shop.id)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/products', params: { name: 'Mary' } }

      it 'retruns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed/)
      end
    end
  end

  describe 'PUT /products/:id' do
    let(:valid_attr) { { name: 'test' } }

    context 'when the record exists' do
      before { put "/api/products/#{product_id}", params: valid_attr }

      it 'updates a record' do
        expect(response.body).to be_empty
      end

      it 'updates status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE products/:id' do
    before do
      products = create(:product)
      delete "/api/products/#{products.id}"
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
