require 'spec_helper'

describe Project do
  describe "Creations" do
    before :each do
      @u = FactoryGirl.create(:user)
      @u2 = FactoryGirl.create(:user, email: "test@t.com")
      @project = @u.projects.create!(title: "Test", description: "Body content")
    end
    it "should respond to members" do
      @project.should respond_to(:members)
    end
    it "should have user 2 as member" do
      @project.members << @u2
      @project.members.should include(@u2)
    end
  end
end
