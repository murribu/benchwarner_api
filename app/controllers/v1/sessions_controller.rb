module V1
  class SessionsController < ApplicationController
    
    # POST /v1/login
    def create
      @user = User.find_for_database_authentication(email: params[:email])
      return invalid_login_attempt_not_found unless @user

      if @user.valid_password?(params[:password])
        sign_in :user, @user
        app_id = OauthAccessToken.where(token: request.headers['Authorization']).first.id
        new_token = @user.oauth_access_tokens.create(:oauth_application_id => app_id, :token => Faker::Lorem.characters(60), :scope => 'user', :expires_at => 24.hours.from_now)
        retVal = {token: new_token.token}
        render json: retVal
      else
        invalid_login_attempt
      end
    end
    private

      def invalid_login_attempt_not_found
        warden.custom_failure!
        render json: {error: "sessions_controller.invalid_login_attempt"}, status: 403
      end
      
      def invalid_login_attempt
        warden.custom_failure!
        render json: {error: "sessions_controller.invalid_login_attempt"}, status: :unprocessable_entity
      end
  end
end