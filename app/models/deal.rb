class Deal < ApplicationRecord
  belongs_to :user

  has_many :daily_deals, dependent: :destroy

  validates_presence_of :deal_target, :year
  validates_each :year do |record, attr, value|
    record.errors.add(attr, 'deal already set for year') if Deal.where(year: value.beginning_of_year).exists?
  end

  before_save :set_year

  def set_year
    self.year = year.beginning_of_year
  end

  def monthly_target
    (deal_target / 12)
  end

  def weekly_target
    (deal_target / 52)
  end

  def daily_target
    (deal_target / 365)
  end
end
