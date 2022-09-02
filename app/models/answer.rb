class Answer < ApplicationRecord
  belongs_to :question

  enum tag: { random: 0, value: 3, goal: 5, cause: 10, hero: 15, inspiration: 20 }
end
