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
    describe "Success" do
      before :each do
        @user = FactoryGirl.create(:user)
        @attr = { email: @user.email, password: @user.password }
      end
      
      it "should sign user in" do
        post :create, session: @attr
        # test for sign ins
        controller.current_user.should == @user
        controller.should be_signed_in
      end
      it "should redirect" do
        post :create, session: @attr
        page.should redirect_to(user_path(@user))
      end
    end
    
    describe "DELETE destroy" do
      it "should sign a user out" do
        test_sign_in(FactoryGirl.create(:user))
        delete :destroy
        controller.should_not be_signed_in
        response.should redirect_to(root_path)
      end
    end
  end

end
