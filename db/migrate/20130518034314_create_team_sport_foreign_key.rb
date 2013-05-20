class CreateTeamSportForeignKey < ActiveRecord::Migration
  def up
	add_foreign_key(:teams, :sports)
  end

  def down
  	remove_foreign_key(:teams, :sports)
  end
end
