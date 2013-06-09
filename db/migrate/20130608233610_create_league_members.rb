class CreateLeagueMembers < ActiveRecord::Migration
  def change
    create_table :league_members do |t|
      t.references :league
      t.references :user

      t.timestamps
    end
  end
end
