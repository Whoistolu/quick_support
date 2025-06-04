# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
      argument :id, ID, required: true, description: "ID of the object."
    end

    def node(id:)
      context.schema.object_from_id(id, context)
    end

    field :nodes, [Types::NodeType, null: true], null: true, description: "Fetches a list of objects given a list of IDs." do
      argument :ids, [ID], required: true, description: "IDs of the objects."
    end

    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end


    field :tickets, [ Types::TicketType ], null: true,
      description: "Fetches a list of tickets."
    def tickets
      Ticket.all
    end

    field :ticket, Types::TicketType, null: true do
      description "Fetch a single ticket by ID"
      argument :id, ID, required: true
    end
    def ticket(id:)
      Ticket.find_by(id: id)
    end
  end
end
