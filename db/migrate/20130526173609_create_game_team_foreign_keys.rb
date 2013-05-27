class CreateGameTeamForeignKeys < ActiveRecord::Migration
  def up
  	add_foreign_key(:games, :teams, column: 'home_team_id')
	add_foreign_key(:games, :teams, column: 'away_team_id')
  end

  def down
  	remove_foreign_key(:games, column: 'home_team_id')
	remove_foreign_key(:games, column: 'away_team_id')
  end
end
