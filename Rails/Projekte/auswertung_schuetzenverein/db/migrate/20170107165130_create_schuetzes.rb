class CreateSchuetzes < ActiveRecord::Migration[5.0]
  def change
    create_table :schuetzes do |t|
      t.integer :startnummer
      t.string :vorname
      t.string :name
      t.string :ort

      t.timestamps
    end
  end
end
