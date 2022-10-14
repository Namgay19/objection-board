# frozen_string_literal: true

module Mutations
  class BookCreate < BaseMutation
    description "Creates a new book"

    class BookCreateAttributes < Types::BaseInputObject
      argument :title, String, required: true
      argument :author, String, required: false
      argument :description, String, required: false
      argument :image, Attributes::ImageAttributes, as: :image_attributes, required: false
    end

    argument :attributes, BookCreateAttributes, required: true
    type Types::BookType, null: false

    def resolve(attributes:)
      book = Book.new(attributes.to_h)
      book.creator = current_user
      book.save!
      book
    end
  end
end
