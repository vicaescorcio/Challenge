class User < ActiveRecord::Base
  
 VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

      before_save {self.email.downcase!}

      validates :name, presence: true, length: {maximum: 50}
      validates :email, presence: true, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
      validates  :register, presence: true, length: {maximum: 6}, uniqueness: true
      has_secure_password
      validates :password, presence: true, length: {minimum: 6}
end
