module Attributes
  class ImageAttributes < Types::BaseInputObject
    argument :id, ID, required: false
    argument :avatar, Types::FileType, required: false
    argument :_destroy, Boolean, required: false
  end
end
