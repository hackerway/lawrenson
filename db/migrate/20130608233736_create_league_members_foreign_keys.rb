class CreateLeagueMembersForeignKeys < ActiveRecord::Migration
  def up
  	add_foreign_key(:league_members, :leagues)
	add_foreign_key(:league_members, :users)
  end

  def down
  	remove_foreign_key(:league_members, :leagues)
	remove_foreign_key(:league_members, :users)
  end
end
