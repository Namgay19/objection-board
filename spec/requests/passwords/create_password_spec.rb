require 'rails_helper'

describe 'Request new password' do
  let!(:user) { create(:user, role: Role.first) }

  it 'Sends password reset instructions' do
    post user_password_path, params: { user: { email: user.email } }
    expect(status).to eq(200)

    expect(ActionMailer::Base.deliveries.count).to eq(1)
    mail = ActionMailer::Base.deliveries.first
    expect(mail.subject).to eq("Reset password instructions")
  end
end
