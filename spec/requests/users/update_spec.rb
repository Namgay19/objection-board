require 'rails_helper'

describe 'Update user' do
  let!(:user_1) { create(:user, role: Role.first) }
  let!(:token) { user_token(user_1) }
  let(:params) {
    <<~GQL
      mutation {
        updateUser(attributes: {
          firstName: "Namgy",
          lastName: "Teny",
          email: "namgayt8@gmail.com",
          phone: "1772232",
          mobile: "123456"
        }) {
          id
          firstName
          mobile
        }
      }
    GQL
  }

    it 'updates a single user' do
      post api_v1_graphql_path, params: { query: params }, headers: header_params(token: token)
      expect(status).to eq(200)
    end
end
