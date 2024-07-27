class CreateSurveys < ActiveRecord::Migration[7.1]
  def change
    create_table :surveys do |t|
      t.integer :user_id
      t.text :result

      t.timestamps
    end
  end
end
