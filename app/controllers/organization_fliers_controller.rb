class OrganizationFliersController < ApplicationController
  def add
    OrganizationFlier.create!(:organization_id => current_user.id, :flier_id => params[:flier_id], :attending_status => '1')
    redirect_to myboard_path
  end

  def delete
    OrganizationFlier.find_by_organization_id_and_flier_id(current_user.id, params[:flier_id]).delete
    redirect_to myboard_path
  end
end
