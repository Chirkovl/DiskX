class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable

  has_many :documents
  validates :username, length: { maximum: 15 }
  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*()\-+_{};':"\\|,.<>?]).{8,30}\z/,
                                 message: 'должен содержать буквы, цифры и спецсимволы и должен быть не менее 8 символов и не более 30' }
end
