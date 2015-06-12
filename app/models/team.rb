class Team < ActiveRecord::Base
  belongs_to :league
  has_many :home_games, foreign_key: home_team_id, class_name: "Game"
  has_many :away_games, foreign_key: away_team_id, class_name: "Game"
  has_many :players
  has_many :player_games
end