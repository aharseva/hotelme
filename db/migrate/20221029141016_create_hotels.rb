class CreateHotels < ActiveRecord::Migration[7.0]
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :address
      t.integer :price
      t.integer :rating
      t.integer :occupancy
      t.text :description
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
