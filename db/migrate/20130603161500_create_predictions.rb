class CreatePredictions < ActiveRecord::Migration
  def change
    create_table :predictions do |t|
      t.integer :home_score, :null => false
      t.integer :away_score, :null => false
	  t.references :user, :null => false
      t.references :game, :null => false

      t.timestamps
    end
  end
end
