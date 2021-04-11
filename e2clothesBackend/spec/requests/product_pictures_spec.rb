require 'rails_helper'

RSpec.describe 'ProductPictures', type: :request do
  let!(:pps) { create_list(:product_picture, 5) }
  let(:pp_id) { pps.first.id }
  describe 'GET /product_pictures' do
    # make http GET request before example
    before { get '/api/product_pictures' }
    it 'return product_pictures' do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /product_pictures/:id' do
    before { get "/api/product_pictures/#{pp_id}" }

    context 'when the record exists' do
      it 'returns the product_picture' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(pp_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does exist' do
      let(:pp_id) { 10 }

      it 'retruns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns product_picture not found message' do
        expect(response.body).to match("{\"message\":\"Couldn't find ProductPicture with 'id'=10\"}")
      end
    end
  end

  describe 'POST /product_pictures' do
    # valid payload
    let(:product) { create(:product) }
    let(:valid_attr) { JSON.parse(build(:product_picture, product_id: product.id).to_json) }

    context 'when the record valid' do
      before { post '/api/product_pictures', params: valid_attr }

      it 'create a product_pictures' do
        expect(json['product_id']).to eq(product.id)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/product_pictures', params: { name: 'test' } }

      it 'retruns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed/)
      end
    end
  end

  describe 'PUT /product_pictures/:id' do
    let(:valid_attr) { { name: 'test' } }

    context 'when the record exists' do
      before { put "/api/product_pictures/#{pp_id}", params: valid_attr }

      it 'updates a record' do
        expect(response.body).to be_empty
      end

      it 'updates status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE product_pictures/:id' do
    before do
      product_pictures = create(:product_picture)
      delete "/api/product_pictures/#{product_pictures.id}"
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
