class User < ActiveRecord::Base
  has_secure_password

  validates :username,
            :presence => {:message => "is blank"},
            :uniqueness => true
  validates :password,
            :presence => {:message => "is blank"}
end

