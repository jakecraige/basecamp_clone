class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  has_many :projects
  has_many :discussions
  has_many :comments
  has_many :text_documents
  has_many :tasks

  has_many :memberships
  has_many :member_of_project, through: :memberships, source: :project

  def owns?(object)
    object.user == self
  end
end
