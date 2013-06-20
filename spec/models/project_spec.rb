require 'spec_helper'

describe Project do
  describe "Creations" do
    before :each do
      @u = FactoryGirl.create(:user)
      @project = @u.projects.create!(title: "Test", description: "Body content")
    end
    it "should respond to members" do
      @project.should respond_to(:members)
    end
    #it "should have user as member" do
      #@project.members.should include(@u)
    #end
  end
end
