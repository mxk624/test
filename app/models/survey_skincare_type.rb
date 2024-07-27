class SurveySkincareType < ApplicationRecord
  belongs_to :survey
  belongs_to :skincare_type
end
