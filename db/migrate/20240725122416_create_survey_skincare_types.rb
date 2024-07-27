class CreateSurveySkincareTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :survey_skincare_types do |t|
      t.integer :survey_id
      t.integer :skincare_type_id

      t.timestamps
    end
  end
end
