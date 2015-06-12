class League < ActiveRecord::Base
  belongs_to :level
  has_many :teams
end