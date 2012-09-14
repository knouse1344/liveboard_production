class SendInvitations
  @queue = :invitation_queue
  def self.perform(inviter_id, invitee_id, flier_id)
        @inviter = inviter_id
        @invitation = Myflier.find_by_user_id_and_flier_id(invitee_id, flier_id)
        @invitation.update_attributes(:attending_status => 0, :inviter_id => @inviter)
  end
end
