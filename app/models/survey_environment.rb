class SurveyEnvironment < ApplicationRecord
  belongs_to :survey
  belongs_to :environment
end
