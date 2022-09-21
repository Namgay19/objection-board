module Mutations
  class DeleteObjection < BaseMutation
    argument :id, ID, required: true
    type Types::ObjectionType

    def resolve(id:)
      objection = Objection.find(id)
      objection.destroy!
    end
  end
end
