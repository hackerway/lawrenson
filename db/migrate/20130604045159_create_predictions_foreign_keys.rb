class CreatePredictionsForeignKeys < ActiveRecord::Migration
  def up
  	add_foreign_key(:predictions, :users)
	add_foreign_key(:predictions, :games)
  end

  def down
  	remove_foreign_key(:predictions, :users)
	remove_foreign_key(:predictions, :games)
  end
end
