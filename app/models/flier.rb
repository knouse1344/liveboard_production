require 'chronic'
class Flier < ActiveRecord::Base


  attr_accessible :category, :community_id, :description, :image,
    :end_time, :group, :start_time, :tag, :title, :privacy_status, :channel_id, :creator_id, :added_count
    validates :community_id, :presence => true
    validates :description, :presence => {  :message => "Your event needs a description."}, :length => {:in => 10..500, :too_short => "Your event needs a longer description.", :too_long => "Your event needs a shorter description."}
    validates :image, :presence => { :message => "You must upload an image." }, :on => :create
    validates :start_time, :presence => { :message => "You must select a date."}
    validates_datetime :start_time, :on_or_after =>  Time.now, :on_or_after_message => 'Event must be held in the future.'
    validates :title, :presence => { :message => "Your event needs a title." }, :length => { :in => 4..40, :too_short => "Your event title must be at least four characters long.", :too_long => "Your event title must be less than forty characters long."}
    validates :privacy_status, :presence => true

  has_many :myfliers, :dependent => :delete_all
  has_many :OrganizationFliers, :dependent => :delete_all
  belongs_to :community, :foreign_key => "community_id"
  belongs_to :channels, :foreign_key => "channel_id"

   has_attached_file :image, :styles => { :thumb => "200 x 200", :large => "400 x 400"},
     :quality => { :thumb => "-quality 80", :large => '-quality 80'}


     include PgSearch
  pg_search_scope :search, against: [:title, :tag, :description],
      using: {tsearch: {dictionary: "english"}}

  def self.text_search(query)
    if query.present?
      search(query)
    else
      scoped
    end
  end


  def addone
    self.increment!(:added_count, by = 1)
  end

  def minusone
    self.increment!(:added_count, by = -1)
  end

  def self.upcoming(time)
    where("start_time >= ?", time)
  end

  def self.in_my_community(community_id)
    where("community_id = ?", community_id)
  end

end

