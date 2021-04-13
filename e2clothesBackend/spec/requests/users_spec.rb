require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let!(:users) { create_list(:user, 10) }
  let(:user_id) { users.first.id }
  describe 'GET /users' do
    # make http GET request before example
    before { get '/api/users' }
    it 'return users' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /users/:id' do
    before { get "/api/users/#{user_id}" }

    context 'when the record exists' do
      it 'returns the user' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(user_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does exist' do
      let(:user_id) { 10 }

      it 'retruns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns user not found message' do
        expect(response.body).to match("{\"message\":\"Couldn't find User with 'id'=10\"}")
      end
    end
  end

  describe 'POST /users' do
    # valid payload
    let(:valid_attr) { JSON.parse(build(:user, first_name: 'Terry').to_json) }

    context 'when the record valid' do
      before { post '/api/users', params: valid_attr }

      it 'create a user' do
        expect(json['first_name']).to eq('Terry')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/users', params: { first_name: 'Mary' } }

      it 'retruns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed/)
      end
    end
  end

  describe 'PUT /users/:id' do
    let(:valid_attr) { { user_name: 'terryfung' } }
    #   user = users.first
    #   user.name

    # end
    context 'when the record exists' do
      before { put "/api/users/#{user_id}", params: valid_attr }

      it 'updates user record' do
        expect(response.body).to be_empty
      end

      it 'updates status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE users/:id' do
    before do
      user = create(:user)
      delete "/api/users/#{user.id}"
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end

  describe 'POST /signup' do
    let(:user) { build(:user) }
    let(:headers) { valid_headers.except('Authorization') }
    let(:valid_attributes) do
      attributes_for(:user)
    end

    context 'when valid request' do
      before { post '/signup', params: valid_attributes.to_json, headers: headers }

      it 'create a new user' do
        expect(response).to have_http_status(201)
      end

      it 'returns success message' do
        expect(json['message']).to match(/Account created successfully/)
      end

      it 'returns an authentication token' do
        expect(json['auth_token']).not_to be_nil
      end
    end

    context 'when invalid request' do
      before { post '/signup', params: {}, headers: headers }

      it 'does not create a new user' do
        expect(response).to have_http_status(422)
      end

      it 'returns failure message' do
        expect(json['message']).to match(/Validation failed/)
      end
    end
  end
end
