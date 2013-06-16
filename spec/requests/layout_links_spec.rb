require 'spec_helper'

describe "LayoutLinks" do
  describe "when not signed in" do
    it "should show sign in link" do
      visit root_path
      page.should have_link("Sign In", href: signin_path)
    end
  end
  describe "when signed in" do
    before :each do
      @user = FactoryGirl.create(:user)
      visit signin_path
      fill_in "Email",      with: @user.email
      fill_in "Password",   with: @user.password
      click_button "Sign In"
    end
    it "should have sign out link" do
      visit root_path
      page.should have_link("Sign Out", href: signout_path)
    end
    it "should have a profile link" do
      visit root_path
      page.should have_link("Profile", href: user_path(@user))
    end
  end
end
