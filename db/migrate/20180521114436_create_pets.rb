class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :animal_type
      t.string :breed
      t.string :age
      t.text :description
      t.string :location
      t.boolean :home_stay, default: false
      t.boolean :take_away, default: false
      t.boolean :adoptable, default: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
