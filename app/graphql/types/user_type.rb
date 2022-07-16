module Types
  class UserType < BaseObject
    field :id, ID, null: false
    field :email, String, null: false
    field :first_name, String, null: false
    field :last_name, String, null: false
    field :role_id, ID, null: true
    field :role_name, String, null: true
    field :phone, String, null: true
    field :mobile, String, null: true
  end
end
