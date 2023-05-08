class AuthenticationsController < ApplicationController
  before_action :authorize_request, except: :login

  # POST /auth/login
  def login
    user = User.find_by_email(params[:email])
    return render json: { error: 'unauthorized' }, status: :unauthorized unless user&.authenticate(params[:password])

    token = Authorization::JsonWebToken.encode(user.to_json)
    time = Time.now + 24.hours.to_i
    render json: { token: token, expired_at: time.strftime("%m-%d-%Y %H:%M"), username: user.username }, status: :ok
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end
