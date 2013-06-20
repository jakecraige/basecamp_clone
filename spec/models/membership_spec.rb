require 'spec_helper'

describe Membership do
  before :each do
    @user_1 = FactoryGirl.create(:user)
    @user_2 = FactoryGirl.create(:user, email: "test@test.com")
    @proj_attr = { title: "Test Title", description: "This description" }
    #@project_1 = @user_1.project.
    #@project_2 = FactoryGirl.create(:project)
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
