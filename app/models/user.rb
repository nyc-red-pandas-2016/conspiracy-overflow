class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes

  validates :email, :name, presence: true
  validates :email, uniqueness: true
  validates :password, length: {minimum: 6}

  has_secure_password
end
