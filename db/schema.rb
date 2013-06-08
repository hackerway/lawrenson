# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130605022924) do

  create_table "competitions", :force => true do |t|
    t.string   "name",       :null => false
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "active"
    t.integer  "sport_id",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "competitions", ["sport_id"], :name => "competitions_sport_id_fk"

  create_table "competitions_leagues", :id => false, :force => true do |t|
    t.integer "competition_id"
    t.integer "league_id"
  end

  add_index "competitions_leagues", ["competition_id"], :name => "competitions_leagues_competition_id_fk"
  add_index "competitions_leagues", ["league_id"], :name => "competitions_leagues_league_id_fk"

  create_table "games", :force => true do |t|
    t.date     "date",           :null => false
    t.integer  "home_team_id",   :null => false
    t.integer  "away_team_id",   :null => false
    t.integer  "home_score"
    t.integer  "away_score"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "competition_id", :null => false
  end

  add_index "games", ["away_team_id"], :name => "games_away_team_id_fk"
  add_index "games", ["competition_id"], :name => "games_competition_id_fk"
  add_index "games", ["home_team_id"], :name => "games_home_team_id_fk"

  create_table "leagues", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "predictions", :force => true do |t|
    t.integer  "home_score", :null => false
    t.integer  "away_score", :null => false
    t.integer  "user_id",    :null => false
    t.integer  "game_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "predictions", ["game_id"], :name => "predictions_game_id_fk"
  add_index "predictions", ["user_id"], :name => "predictions_user_id_fk"

  create_table "sports", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sports", ["name"], :name => "index_sports_on_name", :unique => true

  create_table "teams", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "logo_url"
    t.integer  "sport_id",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "teams", ["sport_id"], :name => "teams_sport_id_fk"

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",      :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_foreign_key "competitions", "sports", :name => "competitions_sport_id_fk"

  add_foreign_key "competitions_leagues", "competitions", :name => "competitions_leagues_competition_id_fk"
  add_foreign_key "competitions_leagues", "leagues", :name => "competitions_leagues_league_id_fk"

  add_foreign_key "games", "competitions", :name => "games_competition_id_fk"
  add_foreign_key "games", "teams", :name => "games_away_team_id_fk", :column => "away_team_id"
  add_foreign_key "games", "teams", :name => "games_home_team_id_fk", :column => "home_team_id"

  add_foreign_key "predictions", "games", :name => "predictions_game_id_fk"
  add_foreign_key "predictions", "users", :name => "predictions_user_id_fk"

  add_foreign_key "teams", "sports", :name => "teams_sport_id_fk"

end
