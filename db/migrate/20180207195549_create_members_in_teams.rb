class CreateMembersInTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :members_in_teams do |t|
      t.references :team, foreign_key: true
      t.references :member, foreign_key: true

      t.timestamps
    end
  end
end
