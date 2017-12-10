class HousingsController < ApplicationController
  before_action :set_housing, only: [:show, :update, :destroy]

  # GET /housings
  # GET /housings.json
  def index
    @housings = Housing.all
  end

  # GET /housings/1
  # GET /housings/1.json
  def show
  end

  # POST /housings
  # POST /housings.json
  def create
    @housing = Housing.new(housing_params)

    if @housing.save
      render :show, status: :created, location: @housing
    else
      render json: @housing.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /housings/1
  # PATCH/PUT /housings/1.json
  def update
    if @housing.update(housing_params)
      render :show, status: :ok, location: @housing
    else
      render json: @housing.errors, status: :unprocessable_entity
    end
  end

  # DELETE /housings/1
  # DELETE /housings/1.json
  def destroy
    @housing.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_housing
      @housing = Housing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def housing_params
      params.require(:housing).permit(:city, :beds, :length_of_stay, :child_friendly, :kid_notes, :pets_accepted, :pet_notes, :contact_name, :phone_number, :email_address, :notes, :user_id, :status, :verified)
    end
end
