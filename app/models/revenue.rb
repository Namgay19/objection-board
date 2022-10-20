class Revenue < ApplicationRecord
  belongs_to :user

  has_many :daily_revenues, dependent: :destroy

  validates_presence_of :sales_target, :year
  validates_each :year do |record, attr, value|
    record.errors.add(attr, 'revenue already set for year') if Revenue.where(year: value.beginning_of_year).exists?
  end

  before_save :set_year

  def set_year
    self.year = year.beginning_of_year
  end

  def monthly_target
    (sales_target.to_f / 12).round(2)
  end

  def weekly_target
    (sales_target.to_f / 52).round(2)
  end

  def daily_target
    (sales_target.to_f / 365).round(2)
  end
end
