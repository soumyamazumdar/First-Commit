class Api::V1::CompaniesController < ApiController
  before_action :set_id, only: :show

  def index
  	render json: Company.all
  end

  def show
  	render json: @company
  end

  private
  
    def set_id
    	@company = Company.find(params[:id])
    end
    
end