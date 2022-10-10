module Types
  class ObjectionType < BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :description, String, null: true
    field :view_count, Integer, null: false
    field :created_at, String, null: false
    field :creator, UserType, null: false
  end
end
