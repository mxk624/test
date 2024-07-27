class SkincareType < ApplicationRecord
  has_many :survey_skincare_types
  has_many :surveys, through: :survey_skincare_types
  validates :type_name, presence: true
end
