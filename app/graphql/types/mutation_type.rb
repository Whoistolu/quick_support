# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :add_comment_to_ticket, mutation: Mutations::AddCommentToTicket
    field :create_ticket, mutation: Mutations::CreateTicket
    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World"
    end
  end
end
