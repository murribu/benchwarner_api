class Position < ActiveRecord::Base
  belongs_to :sport
  has_many :fantasy_rosterspots
  has_many :position_indices
end