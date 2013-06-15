require 'spec_helper'

describe UsersController do
  render_views

  describe "GET 'show'" do
    before(:each) do
      @user = FactoryGirl.create(:user)
    end

    it "should be successful" do
      get :show, id: @user
      response.should be_success
    end

    it "should find the right user" do
      get :show, id: @user
      assigns(:user).should == @user
    end
    #it "should have the right url in sidebar" do
      #get :show, id: @user
      #response.should have_selector("a", href: user_path(@user.id))
    #end
  end
  describe "GET 'new'" do
    it "should be successful" do
      get :new
      response.should be_success
    end
  end
end
