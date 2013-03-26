class V1::UsersController < V1::BaseController
  skip_before_filter :authenticate_user!, only: [:create]

  # GET /v1/users/1.json
  def show
    render json: user
  end

  # POST /v1/users.json
  def create
    new_user = User.new params[:user]

    if new_user.save
      render json: new_user, status: :created
    else
      render json: new_user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /v1/users/1.json
  def update
    if user.update_attributes params[:user]
      head :no_content
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /v1/users/1.json
  def destroy
    user.destroy

    head :no_content
  end

  private

  def user
    @user ||= User.find params[:id]
  end
end
