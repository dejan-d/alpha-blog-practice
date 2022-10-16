class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_many :articles, dependent: :destroy

  validates :username, presence: true, 
          uniqueness: { case_sensitive: false }, 
          length: { minimum: 3, maximum: 25 }

  validates :email, presence: true,
          uniqueness: { case_sensitive: false },
          length: { maximum: 105 },
          format: { with: URI::MailTo::EMAIL_REGEXP }

  has_secure_password

end
# The keyword self in Ruby enables you to access to the current object — the object that is receiving the current message. The word self can be used in the definition of a class method to tell Ruby that the method is for the self, which is in this case the class. 
