class V1::UsersController < V1::BaseController
  skip_before_filter :authenticate_user!, only: [:create]

  # GET /v1/users/1.json
  def show
    render json: current_user
  end

  # POST /v1/users.json
  def create
    new_user = User.new params[:user]

    if new_user.save
      sign_in(new_user)
      render json: current_user, status: :created, callback: params[:callback]
    else
      render json: new_user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /v1/users/1.json
  def update
    if current_user.update_attributes params[:user]
      head :no_content
    else
      render json: current_user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /v1/users/1.json
  def destroy
    current_user.destroy

    head :no_content
  end
end
