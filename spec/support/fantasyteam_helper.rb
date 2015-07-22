module FantasyteamHelper
  def create_fantasy_team(user_auth_token, args)
    post_with_token "/v1/teams", args, {'Authorization' => user_auth_token}
    JSON.parse(response.body)["id"]
  end
end