class User < ApplicationRecord
  has_many :articles
  before_save {username.downcase!}
  
  has_secure_password
  validates :username, presence: true, uniqueness:{ case_sensitive: false }, format: {with: /[A-Za-z0-9]/i}


end
