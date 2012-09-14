require 'spec_helper'

describe GuestlistController do

  describe "GET 'add'" do
    it "returns http success" do
      get 'add'
      response.should be_success
    end
  end

  describe "GET 'remove'" do
    it "returns http success" do
      get 'remove'
      response.should be_success
    end
  end

end
