module V1
  class TeamsController < ApplicationController
    #POST /v1/teams
    #expect params[:site, :sport, :league_id, :team_id, :team_name, :league_name, :team_id]
    #if the team already exists, you can edit the team_name. If not, create. Either way, return the team's info
    def create
      @team = FantasyTeam.where({id: params[:team_id]})
      if @team.length > 0
        #existing team
        @team[0].update(:name => params[:team_name])
      else
        sport = Sport.where("name = ? or abbr = ? or id = ?", params[:sport], params[:sport], params[:sport].to_i)
        site = FantasySite.where("name = ? or abbr = ? or id = ?", params[:site], params[:site], params[:site].to_i)
        if sport.length != 1
          render json: {"error" => "invalid sport. This is benchwarner's fault, please yell at us"}, status: 403
        else
          sport = sport[0]
        end
        if site.length != 1
          response['Accept'] = 'Yahoo!,ESPN'
          render json: {"error" => "invalid site"}, status: 405
        else
          site = site[0]
          league = FantasyLeague.where({site_id: site["id"], site_generated_id: params[:league_id]})
          if league.length > 0
            #existing league
          else
            league = sport.fantasy_leagues.create(:name => params[:league_name], :site_generated_id => params[:league_id], :site_id => site["id"])
          end
          @team = FantasyTeam.create(:user_id => @auth_user[:id], :name => params[:team_name], :site_generated_id => params[:team_id], :fantasy_league_id => league["id"])
        end
      end
      render json: @team
    end
  end
end