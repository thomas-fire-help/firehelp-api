class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :update, :destroy]
  before_action :require_moderator, except: [:index]

  # GET /tags
  # GET /tags.json
  def index
    @tags = Tag.filter_by_category(params[:category]).page((params[:page] || 0)).per((params[:per_page] || Settings.default.per_page))
  end

  # GET /tags/1
  # GET /tags/1.json
  def show
  end

  # POST /tags
  # POST /tags.json
  def create
    render json: { error: 'Not Authorized' }, status: 401 unless current_user.moderator?
    @tag = Tag.new(tag_params)

    if @tag.save
      render :show, status: :created, location: @tag
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tags/1
  # PATCH/PUT /tags/1.json
  def update
    render json: { error: 'Not Authorized' }, status: 401 unless current_user.moderator?
    if @tag.update(tag_params)
      render :show, status: :ok, location: @tag
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tags/1
  # DELETE /tags/1.json
  def destroy
    render json: { error: 'Not Authorized' }, status: 401 unless current_user.moderator?
    @tag.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_params
      params.permit(:name, :category)
    end
end
