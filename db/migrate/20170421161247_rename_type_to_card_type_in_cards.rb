class RenameTypeToCardTypeInCards < ActiveRecord::Migration[5.0]
  def change
    rename_column :cards, :type, :cardtype
  end
end
