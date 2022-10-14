module Types
  class BaseObject < GraphQL::Schema::Object
    edge_type_class(Types::BaseEdge)
    connection_type_class(Types::BaseConnection)
    field_class Types::BaseField

    def current_user
      context[:current_user]
    end

    def created_at
      object.created_at.strftime('%d/%m/%Y %H:%M:%S')
    end
  end
end
