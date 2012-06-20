class CreateApartments < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.string :address
      t.string :number
      t.text :description
      t.references :territory

      t.timestamps
    end
    add_index :apartments, :territory_id
  end
end
