require 'spec_helper'

describe "Getting player info" do
  
  before do
    @user = create(:user)
    @user_auth_token = retrieve_access_token
  end
  
  it "returns player info" do
    get_with_token "/v1/players/5806", {'Authorization' => @user_auth_token}
    puts response.body
    expect(response.body).to match(/"Verdugo"/)
  end
end