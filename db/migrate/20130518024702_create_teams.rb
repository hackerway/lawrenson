class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :logo_url

	  t.references :sport

      t.timestamps  
    end
  end
end
