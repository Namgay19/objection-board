require 'rails_helper'

describe 'Create task' do
  let!(:user_1) { create(:user, role: Role.first) }
  let!(:token) { user_token(user_1) }
  let(:params) {
    <<~GQL
      mutation {
        createTask(attributes: {
          category: "prospecting",
          startTime: "#{DateTime.now + 3.hours}",
          endTime: "#{DateTime.now + 4.hours}"
        }) {
          id
          category
          startTime
          endTime
          startingTime
          endingTime
          duration
        }
      }
    GQL
  }

  it 'creates a task' do
    post api_v1_graphql_path, params: { query: params }, headers: header_params(token: token)
    expect(status).to eq(200)
  end
end
