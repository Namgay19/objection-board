module Mutations
  class CreateObjection < BaseMutation
    class ObjectionCreateAttributes < Types::BaseInputObject
      argument :title, String, required: true
      argument :description, String, required: false
    end

    argument :attributes, ObjectionCreateAttributes, required: true
    type Types::ObjectionType

    def resolve(attributes:)
      objection = Objection.new(attributes.to_h)
      objection.creator = current_user
      objection.save!
      objection
    end
  end
end
