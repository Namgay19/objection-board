# frozen_string_literal: true

class UserCreator
  attr_accessor :user

  def call
    binding.pry
    @user = User.new(params)

    user.save!
  end
end
