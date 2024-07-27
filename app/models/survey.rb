class Survey < ApplicationRecord
  belongs_to :user
  has_many :survey_body_parts
  has_many :body_parts, through: :survey_body_parts
  has_many :survey_skin_concerns
  has_many :skin_concerns, through: :survey_skin_concerns
  has_many :survey_environments
  has_many :environments, through: :survey_environments
  has_many :survey_skin_types
  has_many :skin_types, through: :survey_skin_types
  has_many :survey_skincare_types
  has_many :skincare_types, through: :survey_skincare_types
  validates :result, presence: true
end
