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
  describe "POST create" do
    describe "failure" do
      before(:each) do
        @attr = { name: "", email: "",
                  password: "", password_confirmation: ""}
      end
      it "should render the new page" do
        post :create, user: @attr
        response.should render_template('new')
      end
      it "should not create a user" do
        lambda do
          post :create, user: @attr
        end.should_not change(User, :count)
      end
    end
    describe "success" do
      before(:each) do
        @attr = { name: "Jake", email: "james.craige@gmail.com",
                  password: "foobar", password_confirmation: "foobar"}
      end
      it "should sign the user in" do
        post :create, user: @attr
        controller.should be_signed_in
      end
    end
  end
end
