class Api::V1::BatchController < Api::V1::ApiBaseController
  before_action :set_batch, only: [:show, :update, :destroy]

  def index
    @batches = Batch.all
    render json: @batches, include: ['stock']
  end

  def show
    render json: @batch, include: ['stock']
  end

  def update
    if @batch.update(permited_batch_params)
      render json: @batch
    else
      render json: @batch.errors, status: :unprocessable_entity
    end
  end

  private
  def set_batch
    @batch = Batch.find params[:id]
  end

  def permited_batch_params
    params.require(:batch).permit(:name, :weight, :meditate_unit)
  end
end