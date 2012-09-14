class Organization < ActiveRecord::Base

  attr_accessible :name, :community_id, :email, :image, :password, :password_confirmation

  has_secure_password


  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
    :message => 'Please enter a valid email address.'
  validates :community_id, :presence => {:message => 'Please select a community for your organizatoin'}
  validates :name, :presence => { :message => 'Your organization needs a name.'}
  validates :image, :presence => { :message => 'Your organization needs an image.'}
  validates :password, :presence => { :message => 'Please enter a password.'}
  validates :password_confirmation, :presence => {:message => 'Please confirm your password.'}

  has_many :OrganizationFliers

  has_many :fliers, :through => :OrganizationFliers,
           :order => :added_count

  has_many :added_fliers, :through => :OrganizationFliers,
           :class_name =>"Flier",
           :source =>:flier,
           :conditions => ['attending_status=?', '1']

  has_many :created_fliers, :through => :OrganizationFliers,
           :class_name =>"Flier",
           :source =>:flier,
           :conditions => ['attending_status=?', '9']

  has_attached_file :image, :styles => { :thumb => "200 x 200", :large => "400 x 400", :tiny => "25 x 25"},
                            :quality => { :thumb => "-quality 80", :large => '-quality 80', :tiny => '-quality 80'}
  belongs_to :community

  def timezone
    Time.zone = community.timezone
  end
end
