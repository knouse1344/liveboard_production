class SessionsController < ApplicationController
  skip_before_filter :logged_in_check
  skip_before_filter :has_community?
  
#for user
  def create
    omnihash = env["omniauth.auth"]
    if user = User.existing_user_from_omniauth(env["omniauth.auth"])
      session[:user_id] = user.id
      redirect_to liveboard_path
    
   else
    #if token = cookies[:token]
    #  if @invitation = Invitation.find_by_invitation_token(token)
    #     @invitation.delete
         user = User.new_user_from_omniauth(omnihash)
         friendship = Friendship.get_friends(user)
         session[:user_id] = user.id
         redirect_to liveboard_path
      #else
      #  redirect_to root_url, :notice => "You must enter a valid invitation token to join the Liveboard."
    
      #end
    #end
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

#for organization
  def registration_redirect
    @email = flash[:email]
    session[:organization_id] = Organization.find_by_email(@email).id
    redirect_to liveboard_path
  end
  
  def org_create
    @email = params[:email]
    if organization = Organization.find_by_email(params[:email])
      if organization && organization.authenticate(params[:password])
        session[:organization_id] = organization.id
        redirect_to liveboard_path
      else
        redirect_to root_url, notice: "An organization is registered with this email, but
                                       the password that you submitted is incorrect."
      end
    else redirect_to :controller => "organizations", :action => "register",
         :email => @email

  end
  end
  def org_destroy
    session[:organization_id] = nil
    redirect_to root_url
  end

end

