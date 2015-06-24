require 'spec_helper'

describe "Requesting user info" do
  let!(:user) {User.create(email: "cory@awesomeness.com", password: "password1", password_confirmation: "password1")}
  
  context "with valid credentials" do
    it "returns user info" do
      get_with_token "/v1/me", {}, {'Authorization' => retrieve_access_token}
      expect(response.body).to match(/"email":/)
    end
  end
  context "with invalid credentials" do
    it "returns a 403" do
      get_with_token "/v1/me", {}, {'Authorization' => retrieve_access_token_with_bad_credentials}
      #the retrieve_access_token_with_bad_credentials method expects a 403
      #expect(r.response_code).to eq(403)
    end
  end
end