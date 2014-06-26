require 'spec_helper'

describe StaticPagesController do

  describe "GET 'news'" do
    it "returns http success" do
      get 'news'
      response.should be_success
    end
  end

  describe "GET 'locator'" do
    it "returns http success" do
      get 'locator'
      response.should be_success
    end
  end

  describe "GET 'about'" do
    it "returns http success" do
      get 'about'
      response.should be_success
    end
  end

end
