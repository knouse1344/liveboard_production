class SendEmail
  @queue = :email_queue
  def self.perform(invitation_id)
    invitation = Invitation.find(invitation_id)
    Mailer.invitation(invitation).deliver
  end
end