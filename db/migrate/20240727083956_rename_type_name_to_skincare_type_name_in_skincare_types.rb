class RenameTypeNameToSkincareTypeNameInSkincareTypes < ActiveRecord::Migration[7.1]
  def change
    rename_column :skincare_types, :type_name, :skincare_type_name
  end
end
