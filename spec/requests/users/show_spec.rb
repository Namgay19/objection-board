require 'rails_helper'

describe 'Fetch user' do
  let!(:user_1) { create(:user, role: Role.first) }
  let!(:token) { user_token(user_1) }
  let(:params) {
    <<~GQL
      query {
        current_user {
          id
          email
        }
      }
    GQL
  }

    it 'fetches a single user' do
      post api_v1_graphql_path, params: { query: params }, headers: header_params(token: token)
      expect(status).to eq(200)
    end
end
