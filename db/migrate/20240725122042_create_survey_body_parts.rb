class CreateSurveyBodyParts < ActiveRecord::Migration[7.1]
  def change
    create_table :survey_body_parts do |t|
      t.integer :survey_id
      t.integer :body_part_id

      t.timestamps
    end
  end
end
