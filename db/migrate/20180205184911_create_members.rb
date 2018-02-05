class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.string :name
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
