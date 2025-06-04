# frozen_string_literal: true

module Mutations
  class AddCommentToTicket < BaseMutation
    argument :ticket_id, ID, required: true
    argument :user_id, ID, required: true
    argument :body, String, required: true

    field :comment, Types::CommentType, null: true
    field :errors, [ String ], null: false

    def resolve(ticket_id:, user_id:, body:)
      ticket = Ticket.find_by(id: ticket_id)
      user = User.find_by(id: user_id)

      return { comment: nil, errors: [ "Ticket or User not found" ] } if ticket.nil? || user.nil?

      comment = Comment.new(ticket: ticket, user: user, body: body)

      if comment.save
        { comment: comment, errors: [] }
      else
        { comment: nil, errors: comment.errors.full_messages }
      end
    end
  end
end
