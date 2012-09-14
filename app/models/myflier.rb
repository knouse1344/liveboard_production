class Myflier < ActiveRecord::Base
  attr_accessible :flier_id, :user_id, :attending_status, :inviter_id, :myscore

  belongs_to :flier
  belongs_to :user

 
end
