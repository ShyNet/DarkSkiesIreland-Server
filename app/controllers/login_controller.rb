class LoginController < ApplicationController

  def verify_details
    name = request.params['username']
    user_id = request.params['user_id']

    @login_attempt = User::authenticate(name, user_id)
  end

end
