require 'rails_helper'

RSpec.describe 'Orders', type: :request do
  let!(:orders) { create_list(:order, 5) }
  let(:order_id) { orders.first.id }
  describe 'GET /orders' do
    # make http GET request before example
    before { get '/api/orders' }
    it 'return orders' do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /orders/:id' do
    before { get "/api/orders/#{order_id}" }

    context 'when the record exists' do
      it 'returns the order' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(order_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does exist' do
      let(:order_id) { 10 }

      it 'retruns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns order not found message' do
        expect(response.body).to match("{\"message\":\"Couldn't find Order with 'id'=10\"}")
      end
    end
  end

  describe 'POST /orders' do
    # valid payload
    let(:user) { create(:user) }
    let(:valid_attr) { JSON.parse(build(:order, name: 'Terry Fung', user_id: user.id).to_json) }

    context 'when the record valid' do
      before { post '/api/orders', params: valid_attr }

      it 'create a orders' do
        expect(json['name']).to eq('Terry Fung')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/orders', params: { name: 'Mary' } }

      it 'retruns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed/)
      end
    end
  end

  describe 'PUT /orders/:id' do
    let(:valid_attr) { { name: 'test' } }

    context 'when the record exists' do
      before { put "/api/orders/#{order_id}", params: valid_attr }

      it 'updates a record' do
        expect(response.body).to be_empty
      end

      it 'updates status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE orders/:id' do
    before do
      orders = create(:order)
      delete "/api/orders/#{orders.id}"
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
