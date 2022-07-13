require 'rails_helper'

module PasswordHelper
  # Somehow for the spec, the reset password token gets extra unnecessary characters
  # like \n, =, 3D. Once these characters are removed, the token is valid
  def reset_password_token # rubocop:disable Metrics/AbcSize Performance/FixedSize
    message = ActionMailer::Base.deliveries.first.to_s
    ActionMailer::Base.deliveries.clear
    rpt_index = message.index('reset_password_token=') + 'reset-password?token='.length
    replacements = [['3D', ''], ['=', '']]
    token = message[rpt_index...message.index('"', rpt_index)].gsub(/\s+/, '')
    replacements.each { |replacement| token.gsub!(replacement[0], replacement[1]) }
    token
  end
end

describe 'Update password' do
  include PasswordHelper

  let!(:user) { create(:user, role: Role.first) }

  before do
    post user_password_path, params: { user: { email: user.email } }
  end

  context 'With proper fields' do
    it 'Updates password' do
      params = {
        user: {
          reset_password_token: reset_password_token,
          password: 'namgay',
          password_confirmation: 'namgay'
        }
      }
      put user_password_path, params: params
      expect(status).to eq(200)
      expect(json[:message]).to eq("Password updated successfully")
    end
  end

  context 'With invalid fields' do
    let!(:params) {
      {
        user: {
          reset_password_token: reset_password_token,
          password: 'namgay',
          password_confirmation: 'namgay'
        }
      }
    }

    it 'Throws error if token is invalid' do
      params[:user][:reset_password_token] = 'invalid-token'
      put user_password_path, params: params
      expect(status).to eq(422)
    end

    it 'Throws error if password is blank' do
      params[:user][:password] = ''
      put user_password_path, params: params
      expect(status).to eq(422)
    end

    it 'Throws error if token is blank' do
      params[:user][:reset_password_token] = ''
      put user_password_path, params: params
      expect(status).to eq(422)
    end

    it 'Throws error if password confirmation does not match password' do
      params[:user].merge!(password: 'AFEd35sttt', password_confirmation: 'AFEd35stt5')
      put user_password_path, params: params
      expect(status).to eq(422)
    end
  end
end
