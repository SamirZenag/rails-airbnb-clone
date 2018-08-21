class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :brand
      t.string :model
      t.text :description
      t.integer :price
      t.references :user, foreign_key: true
      t.float :lat
      t.float :lng
      t.string :address
      t.string :city
      t.integer :postal_code
      t.string :country

      t.timestamps
    end
  end
end
