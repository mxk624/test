class CreateEnvironments < ActiveRecord::Migration[7.1]
  def change
    create_table :environments do |t|
      t.string :environment_type

      t.timestamps
    end
  end
end
