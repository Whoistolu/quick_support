# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :add_comment_to_ticket, mutation: Mutations::AddCommentToTicket
    field :create_ticket, mutation: Mutations::CreateTicket
  end
end
