# frozen_string_literal: true

module Mutations
  class CreateTicket < BaseMutation
    argument :subject, String, required: true
    argument :description, String, required: true
    argument :user_id, ID, required: true
    argument :status, String, required: false, default_value: "open"

    field :ticket, Types::TicketType, null: true
    field :errors, [ String ], null: false


    def resolve(subject:, description:, user_id:)
      user = User.find_by(id: user_id)
      return { ticket: nil, errors: [ "User not found" ] } unless user

      ticket = user.tickets.build(subject: subject, description: description, status: "open")

      if ticket.save
        { ticket: ticket, errors: [] }
      else
        { ticket: nil, errors: ticket.errors.full_messages }
      end
    end
  end
end
