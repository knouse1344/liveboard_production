require 'spec_helper'

describe RealtimeController do

  describe "GET 'verify'" do
    it "returns http success" do
      get 'verify'
      response.should be_success
    end
  end

  describe "GET 'subscription'" do
    it "returns http success" do
      get 'subscription'
      response.should be_success
    end
  end

end
