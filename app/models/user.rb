class User < ApplicationRecord
  has_many :articles
  before_save {username.downcase!}
  
  has_secure_password
  validates :username, presence: true, uniqueness:{ case_sensitive: false }


end
