class LiveboardController < ApplicationController
  def index
    @community_id = current_user.community_id
    @community_name = Community.find_by_id(@community_id).name
    @community = Community.find_by_id(@community_id)
    @channels = Channel.all

    if session[:user_id] #check if this is a user or an organization, if user do the following
    # initiate an array to hold the user's myfliers that will be displayed on liveboard
    
    @top_three = @community.top_fliers.upcoming(Time.zone.now + 7200)
 
    @fliers_for_liveboard = current_user.fliers_for_liveboard.upcoming(Time.zone.now + 7200).in_my_community(current_user.community_id).joins(:myfliers)
  
    #create an array of all fliers that the user has already added
    @current_user_added_fliers = current_user.added_fliers

    #create an array of all fliers that the user created
    @current_user_created_fliers = current_user.created_fliers

    #create an array of fliers that should have an option to add to my board
    @fliers_for_adding = @fliers_for_liveboard - (current_user.added_fliers + current_user.created_fliers)
   

  end

  if session[:organization_id] #if this is an organization, load all fliers
    @organization = current_user
    @fliers_for_org_liveboard = Flier.upcoming(Time.zone.now + 7200).in_my_community(current_user.community_id)
    @fliers_not_to_add = current_user.added_fliers + current_user.created_fliers
    @fliers_for_adding = @fliers_for_org_liveboard - @fliers_not_to_add
  end

end
end

