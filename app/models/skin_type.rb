class SkinType < ApplicationRecord
  has_many :survey_skin_types
  has_many :surveys, through: :survey_skin_types
  validates :skin_type_name, presence: true
end
