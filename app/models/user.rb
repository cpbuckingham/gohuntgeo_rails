class User < ActiveRecord::Base
  has_secure_password

  validates :username,
            :presence => {:message => "is blank"}
  validates :password,
            :presence => {:message => "is blank"}
  validates :email,
            :presence => {:message => "is blank"}
end

