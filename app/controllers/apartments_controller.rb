class ApartmentsController < ApplicationController
  before_filter do
    @building = Building.find(params[:building_id])
  end

  # GET /buildings/:building_id/apartments
  # GET /buildings/:building_id/apartments.json
  def index
    @apartments = @building.apartments

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @apartments }
    end
  end

  # GET /buildings/:building_id/apartments/1
  # GET /buildings/:building_id/apartments/1.json
  def show
    @apartment = @building.apartments.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @apartment }
    end
  end

  # GET /buildings/:building_id/apartments/new
  # GET /buildings/:building_id/apartments/new.json
  def new
    @apartment = @building.apartments.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @apartment }
    end
  end

  # GET /buildings/:building_id/apartments/1/edit
  def edit
    @apartment = @building.apartments.find(params[:id])
  end

  # POST /buildings/:building_id/apartments
  # POST /buildings/:building_id/apartments.json
  def create
    @apartment = @building.apartments.build(params[:apartment])

    respond_to do |format|
      if @apartment.save
        format.html { redirect_to building_apartment_url(@building, @apartment), notice: 'Apartment was successfully created.' }
        format.json { render json: @apartment, status: :created, location: @apartment }
      else
        format.html { render action: "new" }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /buildings/:building_id/apartments/1
  # PUT /buildings/:building_id/apartments/1.json
  def update
    @apartment = @building.apartments.find(params[:id])

    respond_to do |format|
      if @apartment.update_attributes(params[:apartment])
        format.html { redirect_to building_apartment_url(@building, @apartment), notice: 'Apartment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buildings/:building_id/apartments/1
  # DELETE /buildings/:building_id/apartments/1.json
  def destroy
    @apartment = @building.apartments.find(params[:id])
    @apartment.destroy

    respond_to do |format|
      format.html { redirect_to building_apartments_url(@building) }
      format.json { head :no_content }
    end
  end
end
