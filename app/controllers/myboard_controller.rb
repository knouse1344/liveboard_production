class MyboardController < ApplicationController
  def index
    @channels = Channel.all
    if session[:user_id]
      @invitations = current_user.invitations.upcoming(Time.zone.now + 7200)
      @created_fliers = current_user.created_fliers.upcoming(Time.zone.now + 7200)
      @added_fliers = current_user.public_added_fliers.upcoming(Time.zone.now + 7200)
      @academic_fliers = current_user.public_academics_fliers.upcoming(Time.zone.now + 7200)
      @arts_fliers = current_user.public_arts_fliers.upcoming(Time.zone.now + 7200)
      @nightlife_fliers = current_user.public_nightlife_fliers.upcoming(Time.zone.now + 7200)
      @sports_fliers = current_user.public_sports_fliers.upcoming(Time.zone.now + 7200)
    end
    if session[:organization_id]
      
      @created_fliers = current_user.created_fliers
    end
  end
  end






