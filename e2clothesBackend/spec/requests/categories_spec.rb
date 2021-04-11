require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  let!(:categories) { create_list(:category, 5) }
  let(:category_id) { categories.first.id }
  describe 'GET /categories' do
    # make http GET request before example
    before { get '/api/categories' }
    it 'return categories' do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /categories/:id' do
    before { get "/api/categories/#{category_id}" }

    context 'when the record exists' do
      it 'returns the categoty' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(category_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does exist' do
      let(:category_id) { 10 }

      it 'retruns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns categoty not found message' do
        expect(response.body).to match("{\"message\":\"Couldn't find Category with 'id'=10\"}")
      end
    end
  end

  describe 'POST /categories' do
    # valid payload
    let(:product) { create(:product) }
    let(:valid_attr) { JSON.parse(build(:category, name: 'pen', product_id: product.id).to_json) }

    context 'when the record valid' do
      before { post '/api/categories', params: valid_attr }

      it 'create a categories' do
        expect(json['name']).to eq('pen')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/categories', params: { name: 'Mary' } }

      it 'retruns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed/)
      end
    end
  end

  describe 'PUT /categories/:id' do
    let(:valid_attr) { { city: 'hongkong' } }

    context 'when the record exists' do
      before { put "/api/categories/#{category_id}", params: valid_attr }

      it 'updates a record' do
        expect(response.body).to be_empty
      end

      it 'updates status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE categories/:id' do
    before do
      categories = create(:category)
      delete "/api/categories/#{categories.id}"
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
