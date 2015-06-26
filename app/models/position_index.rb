class PositionIndex < ActiveRecord::Base
  has_many :fantasy_positions
  has_many :real_positions
end