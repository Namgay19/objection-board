module Types
  class DreamAccountType < BaseObject
    field :id, ID, null: false
    field :email, String, null: true
    field :first_name, String, null: false
    field :last_name, String, null: true
    field :phone, String, null: true
    field :company_name, String, null: true
    field :company_address, String, null: true
    field :sales_rep_count, Integer, null: true
    field :annual_revenue, Integer, null: true
    field :identifier, String, null: true
    field :image, ImageType, null: true
    field :questions, [QuestionType], null: true
  end
end
