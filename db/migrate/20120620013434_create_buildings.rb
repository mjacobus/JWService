class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :address
      t.string :number
      t.text :description
      t.references :territory

      t.timestamps
    end
    add_index :buildings, :territory_id
  end
end
