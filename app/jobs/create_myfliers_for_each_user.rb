class CreateMyfliersForEachUser
  @queue = :myfliercreator_queue

def self.perform(user_type, community_id, flier_id)
  @user_type = user_type
  @users = User.find_all_by_community_id(community_id)
  @users.each do |user|
      Myflier.create!(:user_id => user.id, :flier_id => flier_id, :attending_status => nil, :myscore => 100)
  end
end

#if user is a person....
     if @user_type == 1
      @creator_myflier = Myflier.find_by_user_id_and_flier_id(current_user.id, flier_id)
      @creator_myflier.update_attribute(:attending_status, '9')

     end

    #if user is an organization
    if @user_type == 0
      @creator_organizationflier = OrganizationFlier.create!(:organization_id => current_user.id, :flier_id=>flier_id, :attending_status => '9')
    end

end