class AddForeignKeys < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :surveys, :users
    add_foreign_key :survey_body_parts, :surveys
    add_foreign_key :survey_body_parts, :body_parts
    add_foreign_key :survey_skin_concerns, :surveys
    add_foreign_key :survey_skin_concerns, :skin_concerns
    add_foreign_key :survey_environments, :surveys
    add_foreign_key :survey_environments, :environments
    add_foreign_key :survey_skin_types, :surveys
    add_foreign_key :survey_skin_types, :skin_types
    add_foreign_key :survey_skincare_types, :surveys
    add_foreign_key :survey_skincare_types, :skincare_types
  end
end
