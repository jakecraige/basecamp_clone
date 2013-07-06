class UsersController < ApplicationController

  before_filter :authenticate, only: [:edit, :update, :index]
  before_filter :correct_user, only: [:edit, :update]

  def index
    @users = User.paginate(page: params[:page])
    @title = "All Users"
  end

  def new
    @title = "Sign Up"
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @title = @user.name

    user_projects = @user.projects
    member_of = @user.member_of_project

    @projects = user_projects + member_of
    @comments = Comment.where(user_id: @user.id)
    @discussions = Discussion.where(user_id: @user.id)
    @recent_comments = @comments.limit(5)
    @recent_discussions = @discussions.limit(5)

    arr = [@recent_comments, @recent_discussions]
    @feeds = ActivityFeed::feed(arr, {caller: 'User'})
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

  private
    
    def authenticate
      deny_access unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to root_path unless current_user?(@user)
    end
end
