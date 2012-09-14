class Community < ActiveRecord::Base
  attr_accessible :name, :timezone
  has_many :fliers

  has_many :public_fliers,
           :class_name =>"Flier",
           :source =>:flier,
           :conditions => ['privacy_status=?', '1']

  has_many :private_fliers,
           :class_name =>"Flier",
           :source =>:flier,
           :conditions => ['privacy_status=?', '0']
         
  has_many :top_fliers,
           :class_name => "Flier",
           :source => :flier,
           :order => :added_count,
           :limit => 3

  has_many :users
  
end
