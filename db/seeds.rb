#----------OAuth init
o = OauthApplication.create(:name => 'Master', :secret => Rails.application.secrets[:mastersecret], :redirect_uri => 'http://corymmartin.com/callback.php')
o.oauth_access_tokens.create(:token => Rails.application.secrets[:mastertoken], :scope => 'master')
#----------User init
u = User.create(:email => Rails.application.secrets[:defaultemail], :password => Rails.application.secrets[:defaultpassword], :password_confirmation => Rails.application.secrets[:defaultpassword])