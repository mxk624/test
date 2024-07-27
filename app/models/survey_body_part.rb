class SurveyBodyPart < ApplicationRecord
  belongs_to :survey
  belongs_to :body_part
end
