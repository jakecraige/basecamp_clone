class UsersController < ApplicationController
  def new
    @title = "Sign Up"
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @title = @user.name
  end
  def create
    #raise params[:user].inspect
    @user = User.new(params[:user])
    if @user.save
      #handle saving
    else
      @title = "Sign Up"
      render 'new'
    end
  end
  def index
    redirect_to "/users/new"
  end
end
