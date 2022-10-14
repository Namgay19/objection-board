module Mutations
  class CreateDreamAccount < BaseMutation
    class AccountCreateAttributes < Types::BaseInputObject
      argument :first_name, String, required: true
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

    argument :attributes, AccountCreateAttributes, required: true
    type Types::DreamAccountType

    def resolve(attributes:)
      account = DreamAccount.new(attributes.to_h)
      account.user = current_user
      account.save!
      account
    end
  end
end
