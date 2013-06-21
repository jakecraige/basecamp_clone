require 'spec_helper'

describe ProjectsController do

  # This should return the minimal set of attributes required to create a valid
  # Project. As you add validations to Project, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { title:  "Test Title",
                             description: "Test Description" } }
  let(:user) { FactoryGirl.create(:user) }
  let(:user2) { FactoryGirl.create(:user, email: "jake@jake.com") }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ProjectsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "success" do
    before :each do
      test_sign_in(user)
    end
    it "should create a new project" do
      lambda do
        user.projects.create!(valid_attributes)
      end.should change(Project, :count)
    end
    it "should not accept bad params" do
      lambda do
        user.projects.create(title: "", description: "")
      end.should_not change(Project, :count)
    end
  end
  describe "error" do
    it "should not allow you to create project if not signed in" do
      lambda do
        user.projects.create!(valid_attributes)
      end.should_not change(Project, :count)
    end
  end

end
