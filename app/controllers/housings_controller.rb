class HousingsController < ApplicationController
  include Filterable

  before_action :set_housing, only: [:show, :update, :destroy]
  skip_before_action :authenticate_request, only: %i[index show]
  before_action :require_moderator, only: [:destroy]
  before_action :require_verification, only: [:create]

  filter_on :city,           type: :string
  filter_on :beds,            type: :int
  filter_on :length_of_stay, type: :string
  filter_on :pets_accepted,  type: :boolean
  filter_on :verified,       type: :boolean
  filter_on :paid,           type: :boolean
  filter_on :price,          type: :string
  filter_on :neighborhood,   type: :string
  filter_on :housing_type,   type: :string
  filter_on :has_animals,    type: :boolean
  filter_on :tag,            type: :scope, internal_name: :by_tag

  # GET /housings
  # GET /housings.json
  def index
    @housings = filtrate(Housing.active).page((params[:page] || 0)).per((params[:per_page] || Settings.default.per_page))
  end

  # GET /housings/1
  # GET /housings/1.json
  def show
  end

  # POST /housings
  # POST /housings.json
  def create
    @housing = Housing.new(housing_params)
    @housing.user = current_user

    if @housing.save
      tags = (params[:tags] || "").split(', ')
      @housing.tags = Tag.where(id: tags, category: 'housing')
      if @housing.save
        render :show, status: :created, location: @housing
      else
        render json: @housing.errors, status: :unprocessable_entity
      end
    else
      render json: @housing.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /housings/1
  # PATCH/PUT /housings/1.json
  def update
    render json: { error: 'Not Authorized' }, status: 401 unless current_user == @housing.user || current_user.moderator?
    @housing.tags = Tag.where(id: (@housing.tags.pluck(:id) +( params[:tags].split(', ') || [])).uniq, category: 'housing')
    if @housing.update(housing_params)
      render :show, status: :ok, location: @housing
    else
      render json: @housing.errors, status: :unprocessable_entity
    end
  end

  # DELETE /housings/1
  # DELETE /housings/1.json
  def destroy
    render json: { error: 'Not Authorized' }, status: 401 unless current_user == @housing.user || current_user.moderator?
    @housing.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_housing
      @housing = Housing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def housing_params
      params.permit(:city,
                    :beds,
                    :paid,
                    :price,
                    :neighborhood,
                    :housing_type,
                    :has_animals,
                    :length_of_stay,
                    :pets_accepted,
                    :pet_notes,
                    :contact_name,
                    :phone_number,
                    :email_address,
                    :notes)
    end
end
