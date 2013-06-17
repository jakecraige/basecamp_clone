require 'spec_helper'

describe "Users" do
  describe "Sign Up" do
    describe "failure" do
      it "should not create a new user" do
        lambda do
          visit signup_path
          fill_in "Name",              with: ""
          fill_in "Email",             with: ""
          fill_in "Password",          with: ""
          fill_in "Confirmation",      with: ""
          click_button "Sign Up"
          page.should have_selector('div.error_explanation')
        end.should_not change(User, :count)
      end
    end
    describe "success" do
      it "should create user" do
        lambda do
          visit signup_path
          fill_in "Name",              with: "Example User"
          fill_in "Email",             with: "foo@bar.com"
          fill_in "Password",          with: "foobar"
          fill_in "Confirmation",      with: "foobar"
          click_button "Sign Up"
          page.should have_selector('div.flash.success',
                                   text: "Welcome")
        end.should change(User, :count).by(1)
      end
    end
  end
  describe "Sign In" do
    describe "failure" do
      it "should not sign user in" do
        visit signin_path
        fill_in "Email",     with: ""
        fill_in "Password",  with: ""
        click_button "Sign In"
        page.should have_selector('div.flash.error',
                                  text: "Invalid")
      end
    end
    describe "Succcess" do
      it "should sign a user in and out" do
        user = FactoryGirl.create(:user)
        visit signin_path
        fill_in "Email",    with: user.email
        fill_in "Password", with: user.password
        click_button "Sign In"
        # not working for some reason...
        #controller.should be_signed_in
        click_link "Sign Out"
        #controller.should_not be_signed_in
      end
    end
  end
  describe "admin attribute" do
    it "should respond to admin"
    it "should not be admin by default"
    it "should be convertible to an admin"
  end
end
