class Guestlist < ActiveRecord::Base
  attr_accessible :organization_id, :user_id
end
