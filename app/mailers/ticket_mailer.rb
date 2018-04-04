class TicketMailer < ApplicationMailer
  def buy_ticket(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: user.email, subject: 'Your ticket purchase')
  end

  def return_ticket(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: user.email, subject: 'Your ticket return')
  end
end
