module Mutations
  class DeleteQuestion < BaseMutation
    argument :id, ID, required: true

    type Types::QuestionType

    def resolve(id:)
      question = Question.find(id)
      question.destroy!
    end
  end
end
