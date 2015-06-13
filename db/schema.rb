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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150612183057) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.datetime "start_time"
    t.string   "mlb_game_id"
    t.boolean  "posted"
    t.boolean  "late_scratch"
    t.boolean  "final"
    t.boolean  "postponed"
    t.integer  "home_team_id"
    t.integer  "away_team_id"
    t.boolean  "home_posted"
    t.boolean  "away_posted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "games", ["away_team_id"], name: "index_games_on_away_team_id", using: :btree
  add_index "games", ["home_team_id"], name: "index_games_on_home_team_id", using: :btree
  add_index "games", ["mlb_game_id"], name: "index_games_on_mlb_game_id", using: :btree

  create_table "leagues", force: :cascade do |t|
    t.string   "name"
    t.string   "abbr"
    t.integer  "level_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "leagues", ["level_id"], name: "index_leagues_on_level_id", using: :btree

  create_table "levels", force: :cascade do |t|
    t.string   "name"
    t.string   "abbr"
    t.boolean  "major"
    t.integer  "sport_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "levels", ["sport_id"], name: "index_levels_on_sport_id", using: :btree

  create_table "oauth_access_tokens", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "oauth_application_id", null: false
    t.string   "token",                null: false
    t.string   "scope"
    t.datetime "expires_at"
    t.datetime "revoked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "oauth_access_tokens", ["oauth_application_id"], name: "index_oauth_access_tokens_on_oauth_application_id", using: :btree
  add_index "oauth_access_tokens", ["user_id"], name: "index_oauth_access_tokens_on_user_id", using: :btree

  create_table "oauth_applications", force: :cascade do |t|
    t.string   "name",         null: false
    t.string   "secret",       null: false
    t.string   "redirect_uri", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "player_games", force: :cascade do |t|
    t.date     "date"
    t.integer  "game_id"
    t.integer  "team_id"
    t.integer  "player_id"
    t.string   "mlb_id"
    t.string   "player_name"
    t.string   "position"
    t.string   "batting_order"
    t.boolean  "start"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "player_games", ["game_id"], name: "index_player_games_on_game_id", using: :btree
  add_index "player_games", ["player_id"], name: "index_player_games_on_player_id", using: :btree
  add_index "player_games", ["position"], name: "index_player_games_on_position", using: :btree
  add_index "player_games", ["team_id"], name: "index_player_games_on_team_id", using: :btree

  create_table "players", force: :cascade do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.date     "dob"
    t.string   "bats"
    t.string   "throws"
    t.string   "birthplace"
    t.string   "school"
    t.string   "bbrefminors_id"
    t.string   "mlb_id"
    t.string   "cbs_id"
    t.string   "msn_id"
    t.string   "rotoworld_id"
    t.string   "fangraphs_id"
    t.string   "milb_id"
    t.string   "yahoo_id"
    t.string   "espn_id"
    t.string   "bbref_id"
    t.string   "marcel_id"
    t.integer  "team_id"
    t.boolean  "played_today"
    t.integer  "duplicate_pl_key"
    t.string   "espn_alt_id"
    t.boolean  "starting_today"
    t.date     "last_start"
    t.date     "last_appeared"
    t.string   "twitter_handle"
    t.string   "contract_info"
    t.integer  "pl_key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "players", ["pl_key"], name: "index_players_on_pl_key", using: :btree
  add_index "players", ["team_id"], name: "index_players_on_team_id", using: :btree

  create_table "postions", force: :cascade do |t|
    t.integer  "sport_id"
    t.string   "name"
    t.string   "abbr"
    t.integer  "order"
    t.integer  "fielding_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "postions", ["sport_id"], name: "index_postions_on_sport_id", using: :btree

  create_table "probable_starters", force: :cascade do |t|
    t.integer "player_id"
    t.integer "game_id"
    t.boolean "home"
  end

  add_index "probable_starters", ["game_id"], name: "index_probable_starters_on_game_id", using: :btree
  add_index "probable_starters", ["player_id"], name: "index_probable_starters_on_player_id", using: :btree

  create_table "sports", force: :cascade do |t|
    t.string   "name"
    t.string   "abbr"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.integer  "league_id"
    t.string   "rotoworld_abbr"
    t.string   "cbs_abbr"
    t.string   "mlb_abbr"
    t.string   "yahoo_abbr"
    t.string   "gd2mlb_abbr"
    t.string   "location"
    t.string   "mlb_id"
    t.string   "twitter_handle"
    t.string   "twitter_id"
    t.string   "twitter_oauth_token"
    t.string   "twitter_oauth_token_secret"
    t.string   "twitter_hash"
    t.datetime "last_favorite"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teams", ["league_id"], name: "index_teams_on_league_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "twitter_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
