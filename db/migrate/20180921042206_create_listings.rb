class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :description
      t.string :address
      t.integer :price
      t.integer :rating
      t.string :bed_room_type
      t.integer :bed_room_num
      t.string :bed_type
      t.integer :bed_num
      t.string :bathroom_type
      t.integer :bathroom_num

      t.timestamps
    end
  end
end
