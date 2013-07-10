class Project < ActiveRecord::Base
  attr_accessible :description, :due, :status, :title, :user_id

  belongs_to :user
  has_many :discussions
  has_many :text_documents
  has_many :lists, dependent: :destroy

  has_many :memberships, foreign_key: "project_id"
  has_many :members, through: :memberships, source: :user

  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :user_id

  default_scope order("due ASC")
  scope :active, where(status: true)
  scope :archived, where(status: false)

  def archived?
    !status
  end

  def active?
    status
  end

  def files
    files = []
    self.discussions.each do |discussion|
      if discussion.file?
        files << discussion.file
      end
    end
    self.text_documents.each do |discussion|
      if discussion.file?
        files << discussion.file
      end
    end
    files
  end
end
