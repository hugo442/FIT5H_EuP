class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :unknown0
      t.string :unknown1
      t.integer :shooting_range
      t.integer :marksmen
      t.string :unknown2
      t.string :unknown3
      t.integer :shoot_number
      t.float :value
      t.string :unknown4
      t.string :unknown5
      t.string :unknown6
      t.float :unknown7
      t.string :unknown8
      t.datetime :time_date
      t.string :unknown9
      t.string :unknown10
      t.string :unknown11

      t.timestamps
    end
  end
end
