class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable
   
  validates :username, length: { maximum: 15 }

  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*()\-+_{};':"\\|,.<>?]).{8,30}\z/,
    message: "must include at least one letter, one digit and one special character and be between 8 and 30 characters long" }
end
