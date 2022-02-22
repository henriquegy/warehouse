class Api::V1::ProductEntryController < Api::V1::ApiBaseController
  before_action :set_product_entry, only: [:show, :update, :destroy]
  
  # GET    /api/v1/product_entry(.:format) api_v1_product_entry_index
  def index
    # byebug
    @product_entries = ProductEntry.all
    render json: @product_entries, include: ['stock', 'batch']
  end

  # GET    /api/v1/product_entry/:id(.:format) api_v1_product_entry
  def show
    render json: @product_entry
  end

  # POST   /api/v1/product_entry(.:format)
  def create
    @product_entry = ProductEntry.new(permited_pentry_params)
    if @product_entry.save
      render json: @product_entry, include: ['stock', 'batch'], status: :created
    else
      render json: @product_entry.errors, status: :unprocessable_entity
    end
  end

  # PATCH  /api/v1/product_entry/:id(.:format)
  # PUT    /api/v1/product_entry/:id(.:format)
  def update
    if @product_entry.update(permited_pentry_params)
      render json: @product_entry
    else
      render json: @product_entry.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/product_entry/:id(.:format)
  def destroy
    @product_entry.destroy
  end

  private
  def set_product_entry
    @product_entry = ProductEntry.find params[:id]
  end

  def permited_pentry_params
    params.require(:product_entry).permit(
      :id,
      :name,
      :weight, 
      :meditate_unit,
      :prodentry_with_batch_stocks_attributes => [
        {
          stocks_attributes: [
            :name, 
            batches_attributes: [:name, :weight, :meditate_unit]
          ]
        }
      ]
    )
  end
end