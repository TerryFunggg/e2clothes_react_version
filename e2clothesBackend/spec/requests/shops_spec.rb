require 'rails_helper'

RSpec.describe 'Shops', type: :request do
  let!(:shops) { create_list(:shop, 5) }
  let(:shop_id) { shops.first.id }
  describe 'GET /shops' do
    # make http GET request before example
    before { get '/api/shops' }
    it 'return shops' do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /shops/:id' do
    before { get "/api/shops/#{shop_id}" }

    context 'when the record exists' do
      it 'returns the shop' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(shop_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does exist' do
      let(:shop_id) { 10 }

      it 'retruns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns shop not found message' do
        expect(response.body).to match("{\"message\":\"Couldn't find Shop with 'id'=10\"}")
      end
    end
  end

  describe 'POST /shops' do
    # valid payload
    let(:user) { create(:user) }
    let(:address) { create(:address) }
    let(:valid_attr) { JSON.parse(build(:shop, user_id: user.id, address_id: address.id).to_json) }

    context 'when the record valid' do
      before { post '/api/shops', params: valid_attr }

      it 'create a shops' do
        expect(json['user_id']).to eq(user.id)
        expect(json['address_id']).to eq(address.id)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/shops', params: { name: 'test' } }

      it 'retruns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed/)
      end
    end
  end

  describe 'PUT /shops/:id' do
    let(:valid_attr) { { name: 'test' } }

    context 'when the record exists' do
      before { put "/api/shops/#{shop_id}", params: valid_attr }

      it 'updates a record' do
        expect(response.body).to be_empty
      end

      it 'updates status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE shops/:id' do
    before do
      shops = create(:shop)
      delete "/api/shops/#{shops.id}"
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
