class CreateSurveySkinTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :survey_skin_types do |t|
      t.integer :survey_id
      t.integer :skin_type_id

      t.timestamps
    end
  end
end
