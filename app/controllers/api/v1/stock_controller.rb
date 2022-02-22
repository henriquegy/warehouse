class Api::V1::StockController < Api::V1::ApiBaseController
  before_action :set_stock, only: [:show, :update, :destroy]
  
  def index
    @stocks = Stock.all
    render json: @stocks, include: ['batch']
  end

  def show
    render json: @stock, include: ['batch']
  end

  def update
    if @stock.update(permited_pentry_params)
      render json: @stock
    else
      render json: @stock.errors, status: :unprocessable_entity
    end
  end

  private
  def set_stock
    @stock = Stock.find params[:id]
  end

  def permited_pentry_params
    params.require(:stock).permit(:name)
  end
end
