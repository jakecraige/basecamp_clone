require 'spec_helper'

describe UsersController do
  render_views

  describe "GET 'index'" do
    describe "for non-signed in users" do
      it "should deny access" do
        get :index
        page.should redirect_to(signin_path)
      end
    end

    describe "for signed in users" do
      before :each do
        @user = test_sign_in(FactoryGirl.create(:user))
        FactoryGirl.create(:user, email: "another@example.com")
        FactoryGirl.create(:user, email: "another@example.net")

        30.times do |n|
          FactoryGirl.create(:user, email: "ex-#{n}@example.com")
        end
      end

      it "should allow access" do
        get :index
        response.should be_success
      end

      #it "should have element for each user" do
        #get :index
        #User.all.each do |user|
          #response.should have_text(user.name)
        #end
      #end
    end
  end

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
  end
end
