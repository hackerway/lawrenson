class CreateCompetitionsLeaguesTable < ActiveRecord::Migration
  def change
    create_table :competitions_leagues, :id => false do |t|
      t.references :competition
	  t.references :league
    end
  end
end
