class CreateSkinConcerns < ActiveRecord::Migration[7.1]
  def change
    create_table :skin_concerns do |t|
      t.string :concern

      t.timestamps
    end
  end
end
