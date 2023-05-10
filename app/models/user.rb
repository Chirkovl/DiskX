class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable
  
  has_many :documents
  # validates :username, length: { maximum: 15 }

  # validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*()\-+_{};':"\\|,.<>?]).{8,30}\z/,
  #   message: "must include at least one letter, one digit and one special character and be between 8 and 30 characters long" }
end
