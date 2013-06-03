class AddCompetitionToGames < ActiveRecord::Migration
  def change
    add_column :games, :competition_id, :integer, :null => false
  end
end
