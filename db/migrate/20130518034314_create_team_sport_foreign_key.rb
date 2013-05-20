class CreateTeamSportForeignKey < ActiveRecord::Migration
  def up
	#add_foreign_key(:teams, :sports, :name => 'team_sport_foreign_key')
	add_foreign_key(:teams, :sports)
  end

  def down
  	remove_foreign_key(:teams, :sports)
	#puts "Skipping foreign key rollback"
  end
end
