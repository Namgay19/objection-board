module Types
  class QueryType < BaseObject
    include Pagy::Backend

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
    field :dream_accounts, [DreamAccountType], null: true do
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

    def dream_accounts(params: {})
      begin
        accounts = DreamAccountsQuery.new(params.to_h, current_user).run
        _, records = pagy(accounts, page: params.to_h.fetch(:page, 1), items: params.to_h.fetch(:per_page, 10))
      rescue Pagy::OverflowError
        records = []
      end
      records
    end
  end
end
