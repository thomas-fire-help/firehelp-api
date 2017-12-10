class AnimalsController < ApplicationController
  before_action :set_animal, only: [:show, :update, :destroy]
  skip_before_action :authenticate_request, only: %i[index show]
  before_action :require_moderator, only: [:destroy]

  # GET /animals
  # GET /animals.json
  def index
    @animals = Animal.active.page((params[:page] || 0)).per((params[:per_page] || Settings.default.per_page))
  end

  # GET /animals/1
  # GET /animals/1.json
  def show
  end

  # POST /animals
  # POST /animals.json
  def create
    @animal = Animal.new(animal_params)
    @animal.user = current_user

    if @animal.save
      tags = (params[:tags] || "").split(', ')
      @animal.tags = Tag.where(id: tags, category: 'animal')
      if @animal.save
        render :show, status: :created, location: @animal
      else
        render json: @animal.errors, status: :unprocessable_entity
      end
    else
      render json: @animal.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /animals/1
  # PATCH/PUT /animals/1.json
  def update
    render json: { error: 'Not Authorized' }, status: 401 unless @housing.user == current_user || current_user.moderator?
    @housing.tags = Tag.where(id: (@housing.tags.pluck(:id) +( params[:tags].split(', ') || [])).uniq, category: 'housing')
    if @animal.update(animal_params)
      render :show, status: :ok, location: @animal
    else
      render json: @animal.errors, status: :unprocessable_entity
    end
  end

  # DELETE /animals/1
  # DELETE /animals/1.json
  def destroy
    @animal.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_animal
      @animal = Animal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def animal_params
      params.permit(:type_of_animal, :help_offered, :city, :organization, :contact_name, :phone_number, :email_address, :additional_information, :user_id, :status, :verified)
    end
end
