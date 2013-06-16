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
    @user = User.new(params[:user])

    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the BaseCamp Clone!"
      redirect_to @user
    else
      @title = "Sign Up"
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    @title = "Edit User"
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      flash[:success] = "Profile Updated."
      redirect_to @user
    else
      @title = "Edit User"
      render 'edit'
    end
  end
end
