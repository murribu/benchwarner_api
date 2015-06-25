module V1
  class PlayersController < ApplicationController
    #GET /v1/players/:player_id
    #expect params[:player_id]
    #if it's numeric, return the player with that id
    #else, search first_name and last_name
    #if 1 result, return that player's info
    #else, return a list of players that meet the search
    def search
      if (params[:player_id].match(/\A[0-9]+\Z/)) #is_numeric
        retVal = Player.joins(:team).select("players.*, teams.name, teams.location, teams.mlb_abbr").where("players.id = " + params[:player_id])
      else
        retVal = Player.where("last_name ~* '.*" + params[:player_id] + "' or first_name ~* '.*" + params[:player_id] + "'").take(50)
        if retVal.length == 1
          retVal = retVal[0]
        end
      end
      render json: retVal
    end
  end
end