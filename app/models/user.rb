class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :async,
         :jwt_authenticatable, jwt_revocation_strategy: self

  belongs_to :role
  has_many :tasks, dependent: :destroy
  has_many :dream_accounts, dependent: :destroy

  after_create :set_calendar

  def set_calendar
    SetTasksJob.perform_async(id)
  end

  validates_presence_of :hashed_pin

  enum gender: { male: 0, female: 5, undefined: 10 }
  enum status: { active: 0, inactive: 10 }

  delegate :name, to: :role, prefix: true
end
