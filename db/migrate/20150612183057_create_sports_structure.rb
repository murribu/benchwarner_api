class CreateSportsStructure < ActiveRecord::Migration
  def change
    create_table :sports do |t|
      t.string :name
      t.string :abbr
      t.timestamps
    end
    create_table :levels do |t|
      t.string :name
      t.string :abbr
      t.boolean :major
      t.references :sport, index: true
      t.timestamps
    end
    create_table :leagues do |t|
      t.string :name
      t.string :abbr
      t.references :level, index: true
      t.timestamps
    end
    create_table :teams do |t|
      t.string :name
      t.references :league, index: true
      t.string :rotoworld_abbr
      t.string :cbs_abbr
      t.string :mlb_abbr
      t.string :yahoo_abbr
      t.string :gd2mlb_abbr
      t.string :location
      t.string :mlb_id
      t.string :twitter_handle
      t.string :twitter_id
      t.string :twitter_oauth_token
      t.string :twitter_oauth_token_secret
      t.string :twitter_hash
      t.datetime :last_favorite
      t.timestamps
    end
    create_table :players do |t|
      t.string  :first_name
      t.string  :middle_name
      t.string  :last_name
      t.date    :dob
      t.string  :bats
      t.string  :throws
      t.string  :birthplace
      t.string  :school
      t.string  :bbrefminors_id
      t.string  :mlb_id
      t.string  :cbs_id
      t.string  :msn_id
      t.string  :rotoworld_id
      t.string  :fangraphs_id
      t.string  :milb_id
      t.string  :yahoo_id
      t.string  :espn_id
      t.string  :bbref_id
      t.string  :marcel_id
      t.references  :team, index: true
      t.boolean :played_today
      t.integer :duplicate_pl_key
      t.string  :espn_alt_id
      t.boolean :starting_today
      t.date    :last_start
      t.date    :last_appeared
      t.string  :twitter_handle
      t.string  :contract_info
      t.integer :pl_key, index: true
      t.timestamps
    end
    create_table :games do |t|
      t.datetime  :start_time
      t.string    :mlb_game_id, index: true
      t.boolean   :posted
      t.boolean   :late_scratch
      t.boolean   :final
      t.boolean   :postponed
      t.references  :home_team, references: :teams, index: true
      t.references  :away_team, references: :teams, index: true
      t.boolean   :home_posted
      t.boolean   :away_posted
      t.timestamps
    end
    create_table :player_games do |t|
      t.date    :date
      t.references  :game, index: true
      t.references  :team, index: true
      t.references  :player, index: true
      t.string    :mlb_id
      t.string    :player_name
      t.string    :position, index: true
      t.string    :batting_order
      t.boolean   :start
      t.timestamps
    end
    create_table :postions do |t|
      t.references :sport, index: true
      t.string  :name
      t.string  :abbr
      t.integer :order
      t.integer :fielding_number
      t.timestamps
    end
    create_table :probable_starters do |t|
      t.references  :player, index: true
      t.references  :game, index: true
      t.boolean     :home
    end
  end
end
