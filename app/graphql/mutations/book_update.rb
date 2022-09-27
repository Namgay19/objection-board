# frozen_string_literal: true

module Mutations
  class BookUpdate < BaseMutation
    description "Updates a book by id"

    class BookUpdateAttributes < Types::BaseInputObject
      argument :id, ID, required: true
      argument :title, String, required: false
      argument :author, String, required: false
      argument :description, String, required: false
      argument :image, Attributes::ImageAttributes, as: :image_attributes, required: false

    end

    argument :attributes, BookUpdateAttributes, required: true
    type Types::BookType, null: false

    def resolve(attributes:)
      book = Book.find(attributes.to_h[:id])
      book.update!(attributes.to_h)
      book
    end
  end
end
