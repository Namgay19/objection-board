# frozen_string_literal: true

module Mutations
  class BookDelete < BaseMutation
    description "Deletes a book by ID"

    type Types::BookType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      book = Book.find(id)
      book.destroy!
    end
  end
end
