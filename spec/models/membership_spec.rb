require 'spec_helper'

describe Membership do
  before :each do
    @user_1 = User.create(name: "Jake Craige",
                          email: "jake@jake.com",
                          password: "foobar",
                          password_confirmation: "foobar")
    @user_2 = User.create(name: "Molly Rivad",
                          email: "missrivard@jake.com",
                          password: "foobar",
                          password_confirmation: "foobar")

    @proj_attr = { title: "Test Title", description: "This description" }
  end
  describe "User project relation" do
    it "should own the project it creates" do
      p = @user_1.projects.create!(@proj_attr);
      p.user.should == @user_1
    end
  end
  describe "Project member relation" do
    it "should have both members" do
      p = @user_1.projects.create!(@proj_attr)
      p.members << @user_2
      p.members.should include(@user_2)
      p.members.should_not include(@user_1)
    end
  end
end
