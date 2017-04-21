class AddMoreColumnsToCards < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :type, :string
    add_column :cards, :color, :string
  end
end
