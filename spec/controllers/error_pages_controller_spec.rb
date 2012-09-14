require 'spec_helper'

describe ErrorPagesController do

  describe "GET 'not_friends'" do
    it "returns http success" do
      get 'not_friends'
      response.should be_success
    end
  end

  describe "GET 'friend_not_found'" do
    it "returns http success" do
      get 'friend_not_found'
      response.should be_success
    end
  end

end
