module Mutations
  class DeleteDreamAccount < BaseMutation
    argument :id, ID, required: true
    type Types::DreamAccountType

    def resolve(id:)
      account = DreamAccount.find(id)
      account.destroy!
    end
  end
end
