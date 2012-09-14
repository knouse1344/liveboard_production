class Friendship < ActiveRecord::Base
  attr_accessible :friend_id, :user_id
  
  belongs_to :users, :foreign_key => "user_id"
  belongs_to :friends_ids, :class_name => "users", :foreign_key => "friend_id"
  
  def self.get_friends(user)
    @facebook ||= Koala::Facebook::API.new(user.oauth_token)
    @friends =  @facebook.get_connection(user.fbid, "friends")

    @friends.each do |friend|
      
      if @friend = User.find_by_fbid(friend["id"])
     
         friendship = Friendship.find_or_create_by_user_id_and_friend_id!(user.id, @friend.id)
         friendship_2 = Friendship.find_or_create_by_user_id_and_friend_id!(@friend.id, user.id)
         
     
      end
    end
  end

  def self.real_time_update!(payload)
    RealtimeUpdate.new(payload).enqueue_updates!
  end

    class RealtimeUpdate < Struct.new(:payload)


    def enqueue_updates!
      remove_duplicate_ids.each do |entry|
        if (user = User.find_by_uid(entry['uid']).try(:user))
          Resque.enqueue(Resque::Job::UpdateFacebookFriends, user.id, :since=>entry['time'])
        end
      end
    end

    protected

    def remove_duplicate_ids
      payload['entry'].each_with_object({}) do |entry, hash|
        hash[entry['uid']] ||= [] << entry
      end.values.collect { |update_payloads| update_payloads.min { |entry1, entry2| entry1['time']<=>entry2['time'] } }
    end


  end

end


