class User < ApplicationRecord
  has_many :surveys
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :crypted_password, presence: true
  validates :salt, presence: true
  validates :date_of_birth, presence: true
  validates :gender, presence: true
end
