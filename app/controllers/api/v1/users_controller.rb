class Api::V1::UsersController < ApiController
  
  before_action :set_id,only: :show

  def index
  	render json: User.all
  end

  def show
  end

  private
    def set_id
    	@user = User.find(params[:id])
    end
    
end