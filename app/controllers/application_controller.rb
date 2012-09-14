class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :logged_in_check, :has_community?, :user_time_zone
    private

    def current_user
      @current_user ||= (User.find(session[:user_id]) if session[:user_id]) ||
        (Organization.find(session[:organization_id]) if session[:organization_id])
    end

    def logged_in_check
      if !current_user
        redirect_to :controller => :pages, :action => :welcome
      end
    end

    def user_time_zone
      if current_user
      Time.zone = current_user.timezone
      end
    end
    def has_community?
      if current_user
        if current_user.community_id == '' or current_user.community_id == nil
          redirect_to community_select_path, flash[:notice] => "You must select a community."
        
          
      end
    end
    end
    def are_friends?
     

      @friends = current_user.friends

         if @friend = User.find_by_id(params[:id])
           if @friend.id == current_user.id
             redirect_to(myboard_path)
           else
            unless @friends.find {|f| f["id"] == @friend.fbid }
              redirect_to(not_friends_path(:id => @friend.id))
            end
           end
           
         else
          redirect_to user_not_found_path
         end
     end

    def can_view_flier?
    @flier = Flier.find_by_id(params[:id])
      unless @flier.privacy_status == '1'
        
        @myfliers = current_user.fliers
        unless @myfliers.include?(@flier)
          redirect_to(cant_view_flier_path)
        end
        
      
      end
    end
    


    helper_method :current_user, :has_community?, :logged_in_check, :are_friends?, :can_view_flier?
end
