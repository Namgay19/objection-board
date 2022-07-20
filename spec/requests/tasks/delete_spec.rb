require 'rails_helper'

describe 'Delete task' do
  let!(:user_1) { create(:user, role: Role.first) }
  let!(:token) { user_token(user_1) }
  let!(:task) { create(:task, user: user_1) }
  let(:params) {
    <<~GQL
      mutation {
        deleteTask(id: #{task.id}) {
          id
        }
      }
    GQL
  }

  it 'deletes a task' do
    post api_v1_graphql_path, params: { query: params }, headers: header_params(token: token)
    expect(status).to eq(200)
  end
end
