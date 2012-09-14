class User < ActiveRecord::Base
  

  

  attr_accessible :community_id, :fbid, :fname, :image_url, :lname,
                  :oauth_exp, :oauth_token, :provider, :channel_id

  has_many :myfliers,
           :order => :myscore
           

  has_many :fliers_for_liveboard, :through => :myfliers,
           :source => :flier,
           :include => :myfliers,
           :conditions => "privacy_status = 1"
           

  has_many :fliers, :through => :myfliers

  has_many :public_academics_fliers, :through => :myfliers,
           :class_name => "Flier",
           :source => :flier,
           :conditions => "channel_id = 1" and "privacy_status = 1"

  has_many :public_arts_fliers, :through => :myfliers,
           :class_name => "Flier",
           :source => :flier,
           :conditions => "channel_id = 2" and "privacy_status = 1"

  has_many :public_nightlife_fliers, :through => :myfliers,
           :class_name => "Flier",
           :source => :flier,
           :conditions => "channel_id = 3" and "privacy_status = 1"

  has_many :public_sports_fliers, :through => :myfliers,
           :class_name => "Flier",
           :source => :flier,
           :conditions => "channel_id = 4" and "privacy_status = 1"

  has_many :added_fliers, :through => :myfliers,
           :class_name =>"Flier",
           :source =>:flier,
           :conditions => ['attending_status=?', '1']

  has_many :created_fliers, :through => :myfliers,
           :class_name =>"Flier",
           :source =>:flier,
           :conditions => ['attending_status=?', '9']

  has_many :invitations, :through => :myfliers,
           :class_name =>"Flier",
           :source =>:flier,
           :conditions => ['attending_status=?', '0']

  has_many :public_added_fliers, :through => :myfliers,
           :class_name =>"Flier",
           :source =>:flier,
           :conditions => "attending_status = 1" and "attending_status = 9"

  has_many :added_academic_fliers, :through => :myfliers,
           :class_name => "Flier",
           :source => :flier,
           :conditions => "channel_id = 1" and "attending_status=1"

  has_many :added_arts_fliers, :through => :myfliers,
           :class_name => "Flier",
           :source => :flier,
           :conditions => 'channel_id = 2' and 'attending_status = 1'

  has_many :added_nightlife_fliers, :through => :myfliers,
           :class_name => "Flier",
           :source => :flier,
           :conditions => 'channel_id = 3' and 'attending_status= 1'

  has_many :added_sports_fliers, :through => :myfliers,
           :class_name => "Flier",
           :source => :flier,
           :conditions => 'channel_id= 4' and 'attending_status= 1'



  has_many :friendships

  has_many :friends, :through => :friendships,
           :class_name => "User",
           :source => :users


  belongs_to :community, :foreign_key => "community_id"

  before_create :set_invitation_limit
  
 

  def self.existing_user_from_omniauth(auth)
if User.find_by_fbid(auth.uid)
  where(auth.slice(:provider, :fbid)).find_by_fbid(auth.uid).tap do |user|
    user.provider = auth.provider
    user.fbid = auth.uid
    user.fname = auth.info.first_name
    user.lname = auth.info.last_name
    user.image_url = auth.info.image
    user.oauth_token = auth.credentials.token
    user.oauth_exp = Time.at(auth.credentials.expires_at)
    user.save!
  end
  end
  end

  def self.new_user_from_omniauth(auth)

  where(auth.slice(:provider, :fbid)).find_or_initialize_by_fbid(auth.uid).tap do |user|
    user.provider = auth.provider
    user.fbid = auth.uid
    user.fname = auth.info.first_name
    user.lname = auth.info.last_name
    user.image_url = auth.info.image
    user.oauth_token = auth.credentials.token
    user.oauth_exp = Time.at(auth.credentials.expires_at)
    user.save!
  end
  end

  def friends
    @friends_user_ids = Friendship.find_all_by_user_id(self.id)
    @friends = @friends_user_ids.map{|friend| User.find_by_id(friend.friend_id)}
  end



  def channel_fliers(channel_id)
    fliers_for_liveboard.find_all_by_channel_id(channel_id)
  end

 def timezone
    Time.zone = community.timezone
  end

  def time
    Time.zone.now
  end

  def name
    self.fname + ' ' + self.lname
  end

    private
  def set_invitation_limit
    self.invitation_limit = 10
  end



  

end