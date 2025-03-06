class CreatePets < ActiveRecord::Migration[7.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :age
      t.string :species
      t.string :gender
      t.string :size
      t.boolean :is_available

      t.timestamps
    end
  end
end




