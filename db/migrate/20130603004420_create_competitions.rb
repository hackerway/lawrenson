class CreateCompetitions < ActiveRecord::Migration
  def change
    create_table :competitions do |t|
      t.string :name, :null => false
      t.date :start_date
      t.date :end_date
      t.boolean :active
	  t.references :sport, :null => false

      t.timestamps
    end
  end
end
