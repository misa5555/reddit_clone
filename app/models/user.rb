class User < ActiveRecord::Base
 def self.password=(password)
  @password = password
  self.password_digest = BCrypt::Password.create(password)
 end

 def self.is_password?(password)
    BCrypt::Password.new(self.digest_password).is_password?(password)
 end


end
