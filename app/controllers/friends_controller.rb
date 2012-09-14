class FriendsController < ApplicationController
  before_filter :are_friends?
  def display
    @friend = User.find_by_id(params[:id])
    @fliers = User.find_by_id(params[:id]).public_added_fliers
    @current_users_fliers = current_user.fliers
    @fliers_difference = @fliers - @current_users_fliers
    @fliers_for_adding = @fliers_difference - @current_users_fliers
  end
end
