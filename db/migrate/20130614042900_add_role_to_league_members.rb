class AddRoleToLeagueMembers < ActiveRecord::Migration
  def change
    add_column :league_members, :role_id, :integer
  end
end
