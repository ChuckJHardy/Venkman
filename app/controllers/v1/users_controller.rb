class V1::UsersController < V1::BaseController
  # GET /v1/users/1.json
  def show
    render json: current_user
  end

  # DELETE /v1/users/1.json
  def destroy
    current_user.destroy

    head :no_content
  end
end
