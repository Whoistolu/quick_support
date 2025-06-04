customer = User.create!(
  email: 'tolu@gmail.com',
  name: 'Tolu Smith',
  role: :customer
)

agent = User.create!(
  email: 'ken@gmail.com',
  name: 'Ken Desmond',
  role: :agent
)

Ticket.create!(
  subject: 'Sample Ticket',
  description: 'This is a sample ticket for testing purposes.',
  user: customer,
  status: :open
)

Ticket.create!(
  subject: 'Another Ticket',
  description: 'This is another sample ticket for testing purposes.',
  user: customer,
  status: :closed
)

Comment.create!(
  body: 'This is a comment on the sample ticket.',
  ticket: Ticket.first,
  user: agent
)

Comment.create!(
  body: 'This is another comment on the sample ticket.',
  ticket: Ticket.first,
  user: customer
)