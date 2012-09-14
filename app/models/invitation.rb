class Invitation < ActiveRecord::Base
  attr_accessible :invitation_token, :sender_id, :recipient_email

  belongs_to :sender, :class_name => "User"

  validate :sender_has_invitations, :if => :sender

  before_create :generate_token
  before_create :decrement_sender_count, :if => :sender

  def generate_token
    self.invitation_token = Digest::SHA1.hexdigest([Time.now, rand].join)
  end

  def decrement_sender_count
    sender.decrement! :invitation_limit
  end

  def sender_has_invitations
    unless sender.invitation_limit > 0
      errors.add_to_base "You have reached your limit of invitations to send."
    end
  end

end
