class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.text :bio
      t.integer :year
      t.string :gender
      t.string :orientation
      t.date :birthdate
      t.boolean :likes_women
      t.boolean :likes_men
      t.boolean :likes_other
      t.boolean :asexual
      t.string :house
      t.string :favorite_spell
      t.string :username
      t.string :password_digest

      t.timestamps
    end
  end
end
