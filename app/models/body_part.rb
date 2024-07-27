class BodyPart < ApplicationRecord
  has_many :survey_body_parts
  has_many :surveys, through: :survey_body_parts
  validates :name, presence: true
end
