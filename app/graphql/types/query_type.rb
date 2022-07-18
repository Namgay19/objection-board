module Types
  class QueryType < BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :user, UserType, null: true
    field :task, TaskType, null: true do
      argument :id, ID, required: true
    end
    field :tasks, [TaskType], null: true do
      argument :params, Attributes::TaskQuery, required: false
    end

    def user
      User.find_by(id: current_user.id)
    end

    def task(id:)
      Task.find_by(id: id)
    end

    def tasks(params: {})
      TaskQuery.new(params.to_h, current_user).run
    end
  end
end
