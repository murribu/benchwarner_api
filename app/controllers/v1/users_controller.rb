module V1
  class UsersController < ApplicationController
    def me
      render json: @auth_user
    end
  end
end