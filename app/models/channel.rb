class Channel < ActiveRecord::Base
  attr_accessible :channel
  has_many :fliers
end
