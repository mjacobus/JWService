class AddRevisitDateToApartments < ActiveRecord::Migration
  def change
    add_column :apartments, :next_revisit, :datetime
  end
end
