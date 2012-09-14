class ErrorPagesController < ApplicationController
  def not_friends
    @false_friend = User.find_by_id(params[:id])
  end

  def friend_not_found
  end

  def not_your_flier 
  end

  def cant_view_flier
  end
end
