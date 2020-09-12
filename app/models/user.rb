class User < ActiveRecord::Base
  has_secure_password
  has_many :tweets

  validates :username, presence: true
  validates :password_digest, :email, presence: true
  validates :email, uniqueness: true

def slug
  a = self.username
  b = a.parameterize
  # binding.pry
  b 
end

def self.find_by_slug(slug)

 a = slug.gsub("-", " ")
 # binding.pry
  b = User.find_by(username: a)
  b 
  end



end
