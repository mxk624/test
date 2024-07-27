class SkinType < ApplicationRecord
  has_many :survey_skin_types
  has_many :surveys, through: :survey_skin_types
  validates :type, presence: true
