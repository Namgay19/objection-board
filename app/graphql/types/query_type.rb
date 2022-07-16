module Types
  class QueryType < BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :current_user, UserType, null: true

    def current_user
      User.find_by(id: current_user.id)
    end
  end
end
