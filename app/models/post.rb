class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  has_many :comments
  has_many :users, through: :comments

  validates :title, presence: true
  validates :body, presence: true
end
