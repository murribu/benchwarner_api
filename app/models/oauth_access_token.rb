class OauthAccessToken < ActiveRecord::Base
  validates_uniqueness_of :token
  
  belongs_to :oauth_application
  belongs_to :user
end