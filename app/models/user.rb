class User < ActiveRecord::Base
  # has_many :posts
  has_many :authored_posts, class_name: "Post", foreign_key: "user_id"
  has_many :comments
  has_many :commented_posts, through: :comments, :source => :post , foreign_key: "user_id"


  attr_reader :entered_password

  validates :name, :length => { :minimum => 3, :message => "has to be at least 3 characters." }
  validates :entered_password, :length => { :minimum => 6 }
  validates :email, :uniqueness => true, :format => /\w+@\w+\..+/ 

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(pass)
    @entered_password = pass
    @password = Password.create(pass)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    return user if user && (user.password == password)
    nil # either invalid email or wrong password
  end

end
