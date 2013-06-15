class User < ActiveRecord::Base
  attr_accessible :email, :name
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates_presence_of :name
  validates :email, presence: true, format: { with: email_regex }
end
