class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  easy_roles :roles_mask, method: :bitmask

  # Constant variable storing roles in the system
  ROLES_MASK = %w[admin user]

  before_save :setup_role

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :roles_mask
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

  def setup_role
    add_role 'user'
  end
end
