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
    let(:valid_attr) do
      {
        first_name: 'Terry',
        last_name: 'Fung',
        user_name: 'terry12345',
        password: 'avsadD1212d',
        email: 'terry@gmail.com',
        phone: '93456543',
        is_active: true,
        role: 'buyer'
      }
    end

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
end
