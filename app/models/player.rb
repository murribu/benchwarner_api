class Player < ActiveRecord::Base
  belongs_to :team
  has_many :player_games
  has_many :probable_starters
end