class FantasyLeague < ActiveRecord::Base
  belongs_to :fantasy_site
  belongs_to :sport
  has_many :fantasy_teams
end