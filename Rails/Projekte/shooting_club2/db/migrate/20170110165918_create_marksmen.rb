class CreateMarksmen < ActiveRecord::Migration[5.0]
  def change
    create_table :marksmen do |t|
      t.integer :startnr
      t.string :firstname
      t.string :surname
      t.string :location

      t.timestamps
    end
  end
end
