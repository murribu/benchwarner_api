class Level < ActiveRecord::Base
  belongs_to :sport
  has_many :leagues
end