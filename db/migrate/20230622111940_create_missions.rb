class CreateMissions < ActiveRecord::Migration[7.0]
  def change
    create_table :missions do |t|
      t.string :mission_type
      t.string :date
      t.integer :price

      t.timestamps
    end
  end
end
