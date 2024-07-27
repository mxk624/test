class SkinConcern < ApplicationRecord
  has_many :survey_skin_concerns
  has_many :surveys, through: :survey_skin_concerns
  validates :concern, presence: true
end
