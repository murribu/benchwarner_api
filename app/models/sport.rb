class Sport < ActiveRecord::Base
  has_many :levels
  has_many :postions
end