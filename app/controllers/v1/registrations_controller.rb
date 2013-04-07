class V1::RegistrationsController < DeviseController
  prepend_before_filter :require_no_authentication, only: [:create]

  # POST /v1/registrations
  def create
    if user.save
      render json: {
        authentication_token: user.authentication_token,
        user_id: user.id
      }, status: :created
    else
      warden.custom_failure!
      render json: { message: user.errors }, status: :unprocessable_entity
    end
  end

  private

  def user
    @user ||= User.new(
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
  end
end
