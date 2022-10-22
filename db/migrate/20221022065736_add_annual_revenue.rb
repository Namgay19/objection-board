class AddAnnualRevenue < ActiveRecord::Migration[7.0]
  def change
    add_column :revenues, :client_annual_revenue, :integer, default: 0
  end
end
