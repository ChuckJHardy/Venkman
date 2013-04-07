class V1::SessionsController < DeviseController
  prepend_before_filter :require_no_authentication, only: [:create]

  # POST /v1/sessions
  def create
    User.find_for_database_authentication(email: params[:email]).tap do |user|
      return invalid_login_attempt unless user

      if user.valid_password?(params[:password])
        render json: {
          authentication_token: user.authentication_token,
          user_id: user.id
        }, status: :created
      else
        invalid_login_attempt
      end
    end
  end

  # DELETE /v1/sessions
  def destroy
    sign_out(:user)
    head :no_content
  end

  protected

  def invalid_login_attempt
    warden.custom_failure!
    render json: {}, status: :unauthorized
  end
end
