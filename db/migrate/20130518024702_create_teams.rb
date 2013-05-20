class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name, :null => false
      t.string :logo_url

	  t.references :sport, :null => false

      t.timestamps  
    end
  end
end
