module Mutations
  class UpdateQuestion < BaseMutation
    class QuestionUpdateAttributes < Types::BaseInputObject
      argument :id, ID, required: true
      argument :dream_account_id, ID, required: false
      argument :content, String, required: false

      argument :answers, [Attributes::AnswerAttributes], as: :answers_attributes, required: false
    end

    argument :attributes, QuestionUpdateAttributes, required: true
    type Types::QuestionType

    def resolve(attributes:)
      question = Question.find(attributes.to_h[:id])
      question.update!(attributes.to_h)
      question
    end
  end
end
