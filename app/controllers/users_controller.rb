class UsersController < ApplicationController
   skip_before_filter :has_community?
   skip_before_filter :logged_in_check
   skip_before_filter :user_time_zone
   
   
  def create
  end

  def update
    @user = current_user
    @user.update_attributes(params[:user])
    redirect_to root_url, :notice => 'User updated.'
  end

  def show
  end

  def destroy
  end

  def community_select
   
    @user = current_user
    @channels = Channel.all
  
  end

  



end

