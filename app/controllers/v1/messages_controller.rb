class V1::MessagesController < V1::BaseController
  # GET /v1/users/1/messages.json
  def index
    render json: current_user.messages
  end

  # GET /v1/users/1/messages/1.json
  def show
    render json: message
  end

  # DELETE /v1/users/1/messages/1.json
  def destroy
    message.destroy

    head :no_content
  end

  private

  def message
    current_user.messages.find_by_id params[:id]
  end
end
