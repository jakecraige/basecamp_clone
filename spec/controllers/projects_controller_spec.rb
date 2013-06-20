require 'spec_helper'

describe ProjectsController do

  # This should return the minimal set of attributes required to create a valid
  # Project. As you add validations to Project, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { title:  "Test Title",
                             description: "Test Description",
                             user_id: "1" } }
  let(:user) { FactoryGirl.create(:user) }
  let(:user2) { FactoryGirl.create(:user, email: "jake@jake.com") }
  let!(:project) { user.projects.create! valid_attributes }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ProjectsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

end
