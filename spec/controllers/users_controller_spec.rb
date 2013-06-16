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
  end
  describe "GET edit" do
    before :each do
      @user = FactoryGirl.create(:user)
      test_sign_in(@user)
    end
    it "should be successful" do
      get :edit, id: @user
      response.should be_success
    end
    # wont work for some reason...
    #it "should have a gravatar link" do
      #get :edit, id: @user
      #response.should have_link("Change", href: "http://gravatar.com/emails")
    #end
  end
  describe "PUT update" do
    before :each do
      @user = FactoryGirl.create(:user)
      test_sign_in(@user)
    end
    describe "failure" do
      before(:each) do
        @attr = { name: "", email: "",
                  password: "", password_confirmation: ""}
      end
      it "should render edit page" do
        put :update, id: @user, user: @attr
        page.should render_template('edit')
      end
    end

    describe "Success" do
      before(:each) do
        @attr = { name: "New Name", email: "cat@gmail.com",
                  password: "foobar", password_confirmation: "foobar"}
      end
      it "should change users attributes" do
        put :update, id: @user, user: @attr
        user = assigns(:user)
        @user.reload
        @user.name.should == user.name
        @user.email.should == user.email
        @user.encrypted_password.should == user.encrypted_password
      end

      it "should have flash message" do
        put :update, id: @user, user: @attr
        flash[:success].should =~ /updated/i
      end
    end
  end
  describe "Authentication of user edit/update actions" do
    before :each do
      @user = FactoryGirl.create(:user)
    end

    describe "for non-signed-in users" do
      it "should deny access to edit" do
        get :edit, id: @user
        response.should redirect_to(signin_path)
        flash[:notice].should =~ /sign in/i
      end
      it "should deny access to update" do
        put :update, id: @user, user: {}
        response.should redirect_to(signin_path)
      end
    end

    describe "for signed-in users" do
      before :each do
        @wrong_user = FactoryGirl.create(:user, email: "jake@jake.com")
        test_sign_in(@wrong_user)
      end

      it "should require matching user for edit" do
        get :edit, id: @user
        response.should redirect_to(root_path)
      end

      it "should require matching user for edit" do
        put :update, id: @user, user: {}
        response.should redirect_to(root_path)
      end
    end

  end
end
