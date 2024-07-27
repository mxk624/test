class CreateSurveyEnvironments < ActiveRecord::Migration[7.1]
  def change
    create_table :survey_environments do |t|
      t.integer :survey_id
      t.integer :environment_id

      t.timestamps
    end
  end
end
