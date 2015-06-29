class Sport < ActiveRecord::Base
  has_many :levels
  has_many :positions
  has_many :fantasy_leagues
end