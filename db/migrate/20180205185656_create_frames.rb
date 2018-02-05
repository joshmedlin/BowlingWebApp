class CreateFrames < ActiveRecord::Migration[5.1]
  def change
    create_table :frames do |t|
      t.references :turn, foreign_key: true
      t.references :member, foreign_key: true
      t.integer :ball1
      t.integer :ball2
      t.integer :ball3
      t.integer :score
      t.boolean :isfinal

      t.timestamps
    end
  end
end
