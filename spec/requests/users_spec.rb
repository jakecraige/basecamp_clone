require 'spec_helper'

describe "Users" do
  before(:each) do
    @attr = { name: "Amanda Augustino",
              email: "aaugust@gmail.com",
              password: "foobar",
              password_confirmation: "foobar"}
  end

  describe "Create New User" do
    it "name cannot be blank" do
      user = User.new(@attr.merge(name: ""))
      user.should_not be_valid
    end
    it "email cannot be blank" do
      user = User.new(@attr.merge(email: ""))
      user.should_not be_valid
    end
    it "emails should be valid" do
      emails = %w[james,craige@gmail.com ja&kec2@yahoo-j.com OMG@ja&ke,com]
      emails.each do |email|
        user = User.new(@attr.merge(email: email))
        user.should_not be_valid
      end
    end
  end
  describe "Paswords" do
    before(:each) do
      @user = User.new(@attr)
    end
    it "shoud have a password attribute" do
        @user.should respond_to(:password)
    end
    it "shoud have a password confirmation attribute" do
        @user.should respond_to(:password_confirmation)
    end
  end
  describe "password confirmations" do
    it "should have a password" do
      User.new(@attr.merge(password: "", password_confirmation: "")).
        should_not be_valid
    end
    it "should require matching password confiramtion" do
      User.new(@attr.merge(password_confirmation: "invalid")).
        should_not be_valid
    end
    it "should reject short passwords" do
      short = "a" * 5
      hash = @attr.merge(password: short,
                         password_confirmation: short)
      User.new(hash).should_not be_valid
    end
    it "should reject long passwords" do
      long = "a" * 41
      hash = @attr.merge(password: long,
                         password_confirmation: long)
      User.new(hash).should_not be_valid
    end
  end
  describe "Password encryption" do
    before(:each) do
      @user = User.create!(@attr)
    end
    it "should have a password encryped attribute" do
      @user.should respond_to(:encrypted_password)
    end
  end
end
