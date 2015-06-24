module SessionHelper
  def retrieve_access_token(email="cory@awesomeness.com", password="password1")
    #post api_v1_session_path({email: 'test@example.com', password: 'poor_password'})
    headers = {'HTTP_AUTHORIZATION' => Rails.application.secrets[:mastertoken]}
    post '/v1/login', {email: email, password: password}, headers
    
    expect(response.response_code).to eq(200)
    expect(response.body).to match(/"token":".{60}"/)
    parsed = JSON(response.body)
    parsed['token'] # return token here!!
  end
  def retrieve_access_token_with_bad_credentials(email="me@me.com", password="nottherightpassword")
    #post api_v1_session_path({email: 'test@example.com', password: 'poor_password'})
    headers = {'HTTP_AUTHORIZATION' => Rails.application.secrets[:mastertoken]}
    post '/v1/login', {email: email, password: password}, headers

    expect(response.response_code).to eq(403)
  end
end