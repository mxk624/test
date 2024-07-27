class CreateSurveySkinConcerns < ActiveRecord::Migration[7.1]
  def change
    create_table :survey_skin_concerns do |t|
      t.integer :survey_id
      t.integer :skin_concern_id

      t.timestamps
    end
  end
end
