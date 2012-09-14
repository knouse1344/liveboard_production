class BillboardController < ApplicationController
  def index
    @organization = Organization.find(params[:id])
    @organization
    
  end
end
