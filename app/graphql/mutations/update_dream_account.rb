module Mutations
  class UpdateDreamAccount < BaseMutation
    class AccountUpdateAttributes < Types::BaseInputObject
      argument :id, ID, required: true
      argument :first_name, String, required: false
      argument :last_name, String, required: false
      argument :email, String, required: false
      argument :phone, String, required: false
      argument :company_name, String, required: false
      argument :company_address, String, required: false
      argument :sales_rep_count, Integer, required: false
      argument :annual_revenue, Integer, required: false
      argument :identifier, String, required: false

      argument :image, Attributes::ImageAttributes, as: :image_attributes, required: false
    end

    argument :attributes, AccountUpdateAttributes, required: true
    type Types::DreamAccountType

    def resolve(attributes:)
      account = DreamAccount.find(attributes.to_h[:id])
      account.update!(attributes.to_h)
      account
    end
  end
end
