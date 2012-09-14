class InvitationsController < ApplicationController
  skip_before_filter :logged_in_check, :only => 'store_token'
  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(params[:invitation])
    @invitation.sender_id = current_user.id
    if @invitation.save
    Mailer.invitation(@invitation).deliver
      flash[:notice] = "Thank you, invitation sent."
      redirect_to root_url
    end
  end
   def store_token
     if params[:token]
       cookies[:token] = params[:token]
     end
     redirect_to '/auth/facebook'
   end
    
  end
  

