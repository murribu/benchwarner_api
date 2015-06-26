class FantasyRosterspot < ActiveRecord::Base
  belongs_to :fantasy_team
  belongs_to :player
  belongs_to :position
end