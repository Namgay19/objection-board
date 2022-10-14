module Mutations
  class CreateQuestion < BaseMutation
    class QuestionCreateAttributes < Types::BaseInputObject
      argument :dream_account_id, ID, required: true
      argument :content, String, required: true

      argument :answers, [Attributes::AnswerAttributes], as: :answers_attributes, required: false
    end

    argument :attributes, QuestionCreateAttributes, required: true
    type Types::QuestionType

    def resolve(attributes:)
      question = Question.new(attributes.to_h)
      question.save!
      question
    end
  end
end
