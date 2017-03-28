class CreateMarksmanGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :marksman_groups do |t|
      t.integer :marksman_id
      t.integer :group_id

      t.timestamps
    end
  end
end
