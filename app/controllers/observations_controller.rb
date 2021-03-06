class ObservationsController < ApplicationController
  protect_from_forgery with: :exception, unless: -> { request.format.json? }
  before_action :set_observation, only: [:show, :edit, :update, :destroy]
  before_action :check_secret, if: -> { request.format.json? && secret.present? }

  def last
    if params[:client_id]
      @observation = Observation.where(client_id: params[:client_id]).last
    else
      @observation = Observation.last
    end
    render :show
  end

  # GET /observations
  # GET /observations.json
  def index
    @observations = Observation.all
  end

  # GET /observations/1
  # GET /observations/1.json
  def show
  end

  # GET /observations/new
  def new
    @observation = Observation.new
  end

  # GET /observations/1/edit
  def edit
  end

  # POST /observations
  # POST /observations.json
  def create
    @observation = Observation.new(observation_params)

    respond_to do |format|
      if @observation.save
        format.html { redirect_to @observation, notice: 'Observation was successfully created.' }
        format.json { render :show, status: :created, location: @observation }
      else
        format.html { render :new }
        format.json { render json: @observation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /observations/1
  # PATCH/PUT /observations/1.json
  def update
    respond_to do |format|
      if @observation.update(observation_params)
        format.html { redirect_to @observation, notice: 'Observation was successfully updated.' }
        format.json { render :show, status: :ok, location: @observation }
      else
        format.html { render :edit }
        format.json { render json: @observation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /observations/1
  # DELETE /observations/1.json
  def destroy
    @observation.destroy
    respond_to do |format|
      format.html { redirect_to observations_url, notice: 'Observation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_observation
      @observation = Observation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def observation_params
      params.require(:observation).permit(:client_id, :data)
    end

    def check_secret
      raise ActionController::InvalidAuthenticityToken unless request.headers['secret'] == secret
    end

    def secret
      Rails.application.config.header_secret
    end
end
