class CreateCompetitionsLeaguesForeignKeys < ActiveRecord::Migration
  def up
  	add_foreign_key(:competitions_leagues, :competitions)
	add_foreign_key(:competitions_leagues, :leagues)
  end

  def down
  	remove_foreign_key(:competitions_leagues, :competitions)
	remove_foreign_key(:competitions_leagues, :leagues)
  end
end
