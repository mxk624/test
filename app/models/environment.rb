class Environment < ApplicationRecord
  has_many :survey_environments
  has_many :surveys, through: :survey_environments
  validates :environment_type, presence: true
end
