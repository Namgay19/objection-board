require 'rails_helper'

describe 'Fetch task' do
  let!(:user_1) { create(:user, role: Role.first) }
  let!(:token) { user_token(user_1) }
  let!(:task) { create(:task, user: user_1) }
  let(:params) {
    <<~GQL
      query {
        task(id: #{task.id}) {
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

  it 'fetches a task' do
    post api_v1_graphql_path, params: { query: params }, headers: header_params(token: token)
    expect(status).to eq(200)
  end
end
