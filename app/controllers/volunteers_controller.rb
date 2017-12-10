class VolunteersController < ApplicationController
  before_action :set_volunteer, only: [:show, :update, :destroy]
  skip_before_action :authenticate_request, only: %i[index show]
  before_action :require_moderator, only: [:destroy]

  # GET /volunteers
  # GET /volunteers.json
  def index
    @volunteers = Volunteer.active.page((params[:page] || 0)).per((params[:per_page] || Settings.default.per_page))
  end

  # GET /volunteers/1
  # GET /volunteers/1.json
  def show
  end

  # POST /volunteers
  # POST /volunteers.json
  def create
    @volunteer = Volunteer.new(volunteer_params)
    @volunteer.user = current_user

    if @volunteer.save
      tags = (params[:tags] || "").split(', ')
      @volunteer.tags = Tag.where(id: tags, category: 'volunteer')
      if @volunteer.save
        render :show, status: :created, location: @volunteer
      else
        render json: @volunteer.errors, status: :unprocessable_entity
      end
    else
      render json: @volunteer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /volunteers/1
  # PATCH/PUT /volunteers/1.json
  def update
    @volunteer.tags = Tag.where(id: (@volunteer.tags.pluck(:id) +( params[:tags].split(', ') || [])).uniq, category: 'volunteer')
    if @volunteer.update(volunteer_params)
      render :show, status: :ok, location: @volunteer
    else
      render json: @volunteer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /volunteers/1
  # DELETE /volunteers/1.json
  def destroy
    @volunteer.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_volunteer
      @volunteer = Volunteer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def volunteer_params
      params.permit(:skills, :number_of_volunteers, :volunteers_notes, :organization, :address, :coordinates, :contact_name, :phone_number, :email_address, :additional_information, :user_id, :status, :verified)
    end
end
