module Mutations
  class UpdateUser < BaseMutation
    class UpdateAttributes < Types::BaseInputObject
      argument :id, ID, required: false
      argument :email, String, required: false
      argument :first_name, String, required: false
      argument :last_name, String, required: false
      argument :phone, String, required: false
      argument :mobile, String, required: false
    end

    argument :attributes, UpdateAttributes, required: true
    type Types::UserType

    def resolve(attributes:)
      user = User.find_by(id: current_user.id)
      user.update!(attributes.to_h)
      user
    end
  end
end