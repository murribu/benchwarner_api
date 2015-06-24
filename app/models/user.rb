class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :oauth_access_tokens
  has_many :guessing_game_instances
  has_many :connect_instances
  has_many :connect_players
end
