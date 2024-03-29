require 'rails_helper'

describe 'List task' do
  let!(:user_1) { create(:user, role: Role.first) }
  let!(:token) { user_token(user_1) }
  let!(:task) { create(:task, user: user_1, start_time: DateTime.now + 2.days, end_time: DateTime.now + 2.days + 1.hour) }
  let!(:task_2) { create(:task, user: user_1, category: 'gaming', start_time: DateTime.now + 3.hours, end_time: DateTime.now + 4.hours) }

  let(:params) {
    <<~GQL
      query {
        tasks(params: { date: "#{DateTime.now}" }) {
          id
          category
          startTime
          endTime
          startingTime
          endingTime
          duration
          extraTime
          durationPerDay
          durationPerWeek
          durationPerMonth
          totalTimeByDay
          totalTimeByWeek
          totalTimeByMonth
        }
      }
    GQL
  }

  it 'lists all task' do
    post api_v1_graphql_path, params: { query: params }, headers: header_params(token: token)
    expect(status).to eq(200)
  end
end
