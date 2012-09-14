class ChannelsController < ApplicationController
  def index
    @channels = Channel.all
    @channel = Channel.find_by_id(params[:channel_id])
    @community = Community.find_by_id(current_user.community_id)
    @channel_name = @channel.channel

    #old but not sure if necessary @fliers_for_channel = current_user.channel_fliers(params[:channel_id])

    @myfliers_for_channel = []


    @community.public_fliers.find_all_by_channel_id(params[:channel_id]).each do |flier|
      flier.myfliers.each do |myflier|
        if myflier.user_id == current_user.id
       @myfliers_for_channel << myflier
      end
    end
      @myfliers_for_channel.sort!{|a,b| b.myscore <=> a.myscore}
    end


    
  end
end
