class OrganizationFlier < ActiveRecord::Base
  attr_accessible :attending_status, :flier_id, :organization_id

  belongs_to  :flier
  belongs_to :organization
end
