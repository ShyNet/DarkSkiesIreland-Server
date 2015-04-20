class RegisterController < ApplicationController
  def add_user
    name = request.params['username']
    user_id = request.params['user_id']

    @register_attempt = User::register(name, user_id)
  end
end
