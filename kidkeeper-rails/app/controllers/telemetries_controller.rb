class TelemetriesController < ApplicationController

  before_action :authenticate_user!, except: [:update]

  before_action :find_telemetry, only: [:update, :destroy]

  # GET /telemetries
  # GET /telemetries.json
  def index
    @telemetries = Telemetry.all
  end

  # GET /telemetries/1
  # GET /telemetries/1.json
  def show
    @user = current_user 
    if @user.telemetry.nil?
      @telemetry = @user.build_telemetry
      @telemetry.save
    else
      @telemetry = @user.telemetry
    end
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
    @user = User.where(edison_token: params[:edison_token]).first
    @telemetry = @user.build_telemetry(telemetry_params)

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

  def find_telemetry
    @user = User.where(edison_token: params[:edison_token]).first
    if @user.telemetry.nil?
      @telemetry = @user.build_telemetry
      @telemetry.save
    else
      @telemetry = @user.telemetry
    end
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def telemetry_params
      params.permit(:temp, :air_quality, :light, :sound, :humidity, :longitude, :latitude)
    end
  end
