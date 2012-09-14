class PagesController < ApplicationController
   skip_before_filter :logged_in_check, :user_time_zone
   layout false
  def welcome
    if current_user
      redirect_to liveboard_path
    end
    @channels = Channel.all
    @organization = Organization.new
  end

  def contact
    @channels = Channel.all
  end

  def help
    @channels = Channel.all
  end

  def about
    @channels = Channel.all
  end

  def press
    @channels = Channel.all
  end
end
