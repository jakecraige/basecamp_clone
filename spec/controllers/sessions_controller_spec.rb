require 'spec_helper'

describe SessionsController do
  render_views

  describe "GET 'new'" do
    it "returns http success" do
      get :new
      response.should be_success
    end
  end
  describe "POST 'create'" do
    describe "Failure" do
      before(:each) do
        @attr = { email: "",
                  password: "" }
      end

      it "should render new page" do
        post :create, session: @attr
        response.should be_success
      end
      it "shoudl have an error message" do
        post :create, session: @attr
        flash.now[:error].should =~ /invalid/i
      end
    end
  end

end
