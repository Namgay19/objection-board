module Mutations
  class UpdateObjection < BaseMutation
    class ObjectionUpdateAttributes < Types::BaseInputObject
      argument :id, ID, required: true
      argument :title, String, required: false
      argument :description, String, required: false
    end

    argument :attributes, ObjectionUpdateAttributes, required: true
    type Types::ObjectionType

    def resolve(attributes:)
      objection = Objection.find(attributes.to_h[:id])
      objection.update!(attributes.to_h)
      objection
    end
  end
end
