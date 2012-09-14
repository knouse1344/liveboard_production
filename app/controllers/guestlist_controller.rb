class GuestlistController < ApplicationController
  def add
    Guestlist.create!(:user_id => params[:user_id], :organization_id => params[:organization_id])
    render :text => 'You are now on ' + Organization.find(params[:organization_id] + '\'s guest list.')
  end

  def remove
    @relationship = Guestlist.find_by_user_id_and_organization_id(:user_id => params[:user_id], :organization_id => params[:organization_id])
    Guestlist.remove(@relationship)
    render :text => 'You are no longer on ' + Organization.find( :organization_id => params[:organization_id]) + '\'s guest list.'
  end
end
