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
end
