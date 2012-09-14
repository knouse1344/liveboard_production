class RealtimeController < ApplicationController
 skip_before_filter :logged_in_check
 
 layout nil
  VERIFY_TOKEN = "purple-rain"

  def create
    Friendship.real_time_update!(params)
    render :text => 'success'
  end

  def index
    Rails.logger.info("RealTimeController verification")
    render :text=>Koala::Facebook::RealtimeUpdates.meet_challenge(params, VERIFY_TOKEN)
  end

end