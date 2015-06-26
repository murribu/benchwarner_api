class FantasyLeague < ActiveRecord::Base
  belongs_to :fantasy_site
  has_many :fantasy_teams
end