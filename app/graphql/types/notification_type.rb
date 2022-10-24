# frozen_string_literal: true

module Types
  class NotificationType < Types::BaseObject
    include ActionView::Helpers::DateHelper

    field :id, ID, null: false
    field :message, String
    field :category, String, null: false
    field :read, Boolean, null: false
    field :sent_at, String, null: false

    def sent_at
      "#{time_ago_in_words(object.created_at)} ago"
    end
  end
end
