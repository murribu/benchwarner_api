require 'spec_helper'

describe "For Fantasy teams," do  
  before do
    @user = create(:user)
    @user_auth_token = retrieve_access_token
  end
  
  describe "creating a team that doesn't already exist" do
    it "returns the team's info" do
      post_with_token "/v1/teams", {"site" => "Yahoo!", "sport" => "Baseball", "league_id" => "1234", "team_id" => "4", "team_name" => "Oh no you Dudan't", "league_name" => "Awesome League"}, {'Authorization' => @user_auth_token}
      expect(response.body).to match(/Dudan/)
    end
  end
  describe "editing a team_name" do
    it "returns the team's info" do
      post_with_token "/v1/teams", {"site" => "Yahoo!", "sport" => "Baseball", "league_id" => "1234", "team_id" => "4", "team_name" => "Oh no you Dudan't", "league_name" => "Awesome League"}, {'Authorization' => @user_auth_token}
    arr = JSON.parse(response.body)
    post_with_token "/v1/teams", {"team_id" => arr["id"], "team_name" => "Melvin Diagram"}, {'Authorization' => @user_auth_token}
      expect(response.body).to match(/Melvin/)
    end
  end
end