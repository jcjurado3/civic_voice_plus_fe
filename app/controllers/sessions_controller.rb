class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']
    google_id = auth_hash['uid']
    email = auth_hash['info']['email']
    token = auth_hash['credentials']['token']
    name = auth_hash['info']['first_name']

    user = User.find_or_create_by(email: email)
    user.update(google_id: google_id, token: token, name: name)

    session[:user_id] = user.id

    redirect_to '/dashboard'
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end