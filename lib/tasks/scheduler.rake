desc "This task is called by the Heroku scheduler add-on"
task :update_friends => :environment do
    @users = User.all
    @users.each do |user|
    Friendship.get_friends(user)
    end
    puts "done."
end

task :update_myscores_for_amherst => :environment do
  @fliers = Flier.find_all_by_community_id(1)
  @users = User.find_all_by_community_id(1)
  @fliers.each do |flier|
    @users.each do |user|
     if @myflier = Myflier.find_by_user_id_and_flier_id(user.id, flier.id)
      @friend_count = 0
      user.friends.each do |friend|
        if @friends_flier = Myflier.find_by_user_id_and_flier_id(friend.id, flier.id)
          if @friends_flier.attending_status == 1 || 9 || 8
          @friend_count = @friend_count + 1
          end
        end
      end
     if flier.added_count != nil
       @added_count = flier.added_count
     else @added_count = 0
     end
    # Formula for calculating score
    @score = (100*(@added_count) + 500*(@friend_count) + 5000*rand(5))#/(10*(flier.start_time.to_i - Time.now.to_i))

      @myflier.update_attributes(:myscore => @score.to_r)

      
  end
end
end
end

task :remove_all_outdated_events => :environment do
  if Flier.destroy_all(['start_time <?', Time.now])
    puts 'we did it!'

  end
end
