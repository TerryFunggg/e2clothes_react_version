require 'rails_helper'

RSpec.describe 'ShopStuffs', type: :request do
  let!(:shop_stuffs) { create_list(:shop_stuff, 5) }
  let(:ss_id) { shop_stuffs.first.id }
  describe 'GET /shop_stuffs' do
    # make http GET request before example
    before { get '/api/shop_stuffs' }
    it 'return shops' do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /shop_stuffs/:id' do
    before { get "/api/shop_stuffs/#{ss_id}" }

    context 'when the record exists' do
      it 'returns the shop' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(ss_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:ss_id) { 10 }

      it 'retruns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns shop not found message' do
        expect(response.body).to match("{\"message\":\"Couldn't find ShopStuff with 'id'=10\"}")
      end
    end
  end

  describe 'POST /shop_stuffs' do
    # valid payload
    let(:shop) { create(:shop) }
    let(:valid_attr) { JSON.parse(build(:shop_stuff, shop_id: shop.id).to_json) }

    context 'when the record valid' do
      before { post '/api/shop_stuffs', params: valid_attr }

      it 'create a shops' do
        expect(json['shop_id']).to eq(shop.id)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/shop_stuffs', params: { name: 'test' } }

      it 'retruns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed/)
      end
    end
  end

  describe 'PUT /shop_stuffs/:id' do
    let(:valid_attr) { { name: 'test' } }

    context 'when the record exists' do
      before { put "/api/shop_stuffs/#{ss_id}", params: valid_attr }

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
      shops = create(:shop_stuff)
      delete "/api/shop_stuffs/#{shops.id}"
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
