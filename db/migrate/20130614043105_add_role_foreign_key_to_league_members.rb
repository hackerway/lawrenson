class AddRoleForeignKeyToLeagueMembers < ActiveRecord::Migration
  def up
  	add_foreign_key(:league_members, :roles)
  end

  def down
  	remove_foreign_key(:league_members, :roles)
  end
end
