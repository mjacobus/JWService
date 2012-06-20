class CreateApartments < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.string :number
      t.string :owner
      t.string :email
      t.string :phone
      t.text :notes
      t.date :last_visited
      t.references :building

      t.timestamps
    end
    add_index :apartments, :building_id
  end
end
