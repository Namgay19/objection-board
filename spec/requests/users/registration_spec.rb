require 'rails_helper'

describe 'User Registration' do
  context 'With valid params' do
    let(:params) {
      {
        user: {
          role_id: 2,
          first_name: 'John',
          last_name: 'Cena',
          email: 'namgayt7@gmail.com',
          password: 'password',
          phone: '17619876',
          hashed_pin: '123456'
        }
      }
    }

    it 'registers a user and sends a confirmation email', :run_delayed_jobs do
      post user_registration_path, params: params
      expect(status).to eq(200)
    end
  end
end
