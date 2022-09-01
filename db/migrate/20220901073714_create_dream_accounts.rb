class CreateDreamAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :dream_accounts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :company_name
      t.string :company_address
      t.integer :sales_rep_count
      t.integer :annual_revenue
      t.string :identifier

      t.timestamps
    end
  end
end
