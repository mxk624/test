class CreateSkinTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :skin_types do |t|
      t.string :type

      t.timestamps
    end
  end
end
