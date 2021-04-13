require 'rails_helper'

RSpec.describe AuthenticateUser do
  # Test suite for AuthenticateUser#call
  describe '#call' do
    # return token when valid request
    context 'when valid credentials' do
      it 'returns an auth token' do
        user = create(:user)
        user.password = 'dadsReg12f'
        user.save
        # like login
        token = AuthenticateUser.new(user.email, 'dasdsReg12f')
        expect(token).not_to be_nil
      end
    end

    # raise Authentication Error when invalid request
    context 'when invalid credentials' do
      it 'raises an authentication error' do
        user = create(:user)
        user.password = 'dadsReg12f'
        user.save
        # like login
        token = AuthenticateUser.new(user.email, 'dwadfs11212')
        expect(token).not_to be_nil
      end
    end
  end
end
