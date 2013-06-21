require 'spec_helper'

describe User do
  before :each do
    @user = FactoryGirl.create(:user)
    @proj_attr = { title: "Test Title", description: "This description" }
  end

  it "should own the project it creates" do
    p = @user.projects.create!(@proj_attr);
    p.user.should == @user
  end

end
