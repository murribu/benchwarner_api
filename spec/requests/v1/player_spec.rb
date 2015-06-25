require 'spec_helper'

describe "Getting player info" do
  
  before do
    @user = create(:user)
    @user_auth_token = retrieve_access_token
  end
  
  it "with id, returns player info" do
    get_with_token "/v1/players/3743", {'Authorization' => @user_auth_token}
    expect(response.body).to match(/"Verdugo"/)
  end
  it "with unique name, returns player info" do
    get_with_token "/v1/players/szczur", {'Authorization' => @user_auth_token}
    arr = JSON.parse(response.body)
    expect(arr["id"]).to_not be_nil
    expect(response.body).to match(/"Matt"/)
  end
  it "with non-unique name, returns a list of players" do
  get_with_token "/v1/players/johnson", {'Authorization' => @user_auth_token}
    puts response.body
    arr = JSON.parse(response.body)
    expect(arr["players"][0]["id"]).to_not be_nil
    expect(response.body).to match(/"Chris"/)
  end
end