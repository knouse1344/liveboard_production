class Resque::Job::UpdateFacebookFriends

  @queue        = "facebook_friends"

  def self.perform(uid, opts={})
    ::Timeout.timeout(1800) do
      Friendship.get_friends!(User.find_by_fbid(uid))
    end
  end

end