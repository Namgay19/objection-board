class UserSerializer < ApplicationSerializer
  key :user
  collection_key :users
  serialize(
    :id,
    :email,
    :first_name,
    :last_name,
    :gender,
    :phone,
    :mobile,
    :status
  )

  serialize :role, with: RoleSerializer
end
