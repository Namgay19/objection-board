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
  has_many :objections, dependent: :destroy
  has_many :books, foreign_key: :creator_id, dependent: :destroy
  has_many :audios, dependent: :destroy
  has_many :videos, dependent: :destroy
  has_many :stories, dependent: :destroy
  has_many :revenues, dependent: :destroy

  after_create :set_calendar

  def set_calendar
    SetTasksJob.perform_async(id)
  end

  validates_presence_of :hashed_pin

  enum gender: { male: 0, female: 5, undefined: 10 }
  enum status: { active: 0, inactive: 10 }

  delegate :name, to: :role, prefix: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
