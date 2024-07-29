class RenameTypeInSkinTypes < ActiveRecord::Migration[7.1]
  def change
    rename_column :skin_types, :type, :skin_type_name
  end
end
