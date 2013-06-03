class CreateCompetitionSportForeignKeys < ActiveRecord::Migration
  def up
  	add_foreign_key(:competitions, :sports)
  end

  def down
  	remove_foreign_key(:competitions, :sports)
  end
end
