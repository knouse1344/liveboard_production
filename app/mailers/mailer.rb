class Mailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mailer.invitation.subject
  #
  def invitation(invitation_id)
    @invitation = Invitation.find(invitation_id)
    @sender = User.find_by_id(@invitation.sender_id)
    
    

    mail(to: @invitation.recipient_email,
         from: 'donotreply@theliveboard.com',
         subject: @sender.name + " has invited you to try the Liveboard"
         )
 end
end



