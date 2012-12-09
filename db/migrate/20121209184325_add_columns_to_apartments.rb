class AddColumnsToApartments < ActiveRecord::Migration
  def change
    add_column :apartments, :visited, :boolean, default: true
    add_column :apartments, :revisit, :boolean, default: true
  end
end
