class TelemetriesController < ApplicationController
  before_action :set_telemetry, only: [:show, :edit, :update, :destroy]

  # GET /telemetries
  # GET /telemetries.json
  def index
    @telemetries = Telemetry.all
  end

  # GET /telemetries/1
  # GET /telemetries/1.json
  def show
  end

  # GET /telemetries/new
  def new
    @telemetry = Telemetry.new
  end

  # GET /telemetries/1/edit
  def edit
  end

  # POST /telemetries
  # POST /telemetries.json
  def create
    @telemetry = Telemetry.new(telemetry_params)

    respond_to do |format|
      if @telemetry.save
        format.html { redirect_to @telemetry, notice: 'Telemetry was successfully created.' }
        format.json { render :show, status: :created, location: @telemetry }
      else
        format.html { render :new }
        format.json { render json: @telemetry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /telemetries/1
  # PATCH/PUT /telemetries/1.json
  def update
    respond_to do |format|
      if @telemetry.update(telemetry_params)
        format.html { redirect_to @telemetry, notice: 'Telemetry was successfully updated.' }
        format.json { render :show, status: :ok, location: @telemetry }
      else
        format.html { render :edit }
        format.json { render json: @telemetry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /telemetries/1
  # DELETE /telemetries/1.json
  def destroy
    @telemetry.destroy
    respond_to do |format|
      format.html { redirect_to telemetries_url, notice: 'Telemetry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_telemetry
      @telemetry = Telemetry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def telemetry_params
      params.permit(:temp, :co_level, :meth_level, :longitude, :latitude)
    end
end
