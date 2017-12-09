class SuppliesNeededsController < ApplicationController
  before_action :set_supplies_needed, only: [:show, :update, :destroy]
  skip_before_action :authenticate_request, only: %i[index show]

  # GET /supplies_neededs
  # GET /supplies_neededs.json
  def index
    @supplies_neededs = SuppliesNeeded.all
  end

  # GET /supplies_neededs/1
  # GET /supplies_neededs/1.json
  def show
  end

  # POST /supplies_neededs
  # POST /supplies_neededs.json
  def create
    @supplies_needed = SuppliesNeeded.new(supplies_needed_params)
    @supplies_needed.user = current_user

    if @supplies_needed.save
      render :show, status: :created, location: @supplies_needed
    else
      render json: @supplies_needed.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /supplies_neededs/1
  # PATCH/PUT /supplies_neededs/1.json
  def update
    if @supplies_needed.update(supplies_needed_params)
      render :show, status: :ok, location: @supplies_needed
    else
      render json: @supplies_needed.errors, status: :unprocessable_entity
    end
  end

  # DELETE /supplies_neededs/1
  # DELETE /supplies_neededs/1.json
  def destroy
    @supplies_needed.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplies_needed
      @supplies_needed = SuppliesNeeded.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supplies_needed_params
      params.permit(:organization, :drop_off_location, :phone_number, :drop_off_hours, :email_address, :direct_donations, :items, :special_instructions)
    end
end
