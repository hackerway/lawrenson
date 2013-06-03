class CreateGameCompetitionForeignKey < ActiveRecord::Migration
  def up
  	add_foreign_key(:games, :competitions)
  end

  def down
    remove_foreign_key(:games, :competitions)
  end
end
