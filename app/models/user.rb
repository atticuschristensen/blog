class User < ApplicationRecord
  before_save {username.downcase!}
  
  has_secure_password
  validates :username, uniqueness:{ case_sensitive: false }


end
