require 'spec_helper'

describe "For rosters" do
  before do
    @user = create(:user)
    @user_auth_token = retrieve_access_token
    @fantasy_team = create_fantasy_team(@user_auth_token, {"site" => "Yahoo!", "sport" => "Baseball", "league_id" => "1234", "team_id" => "5", "team_name" => "My secret Syndergaarden", "league_name" => "Awesome League"})
  end
  describe "Setting a new roster" do
    puts @fantasy_team
    post_with_token "/v1/rosterspots", {"team_id" => @fantasy_team}
    expect(response.body).to match("success")
  end
end