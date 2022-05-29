class DeparturesController < ApplicationController
  def index
    @departures = Departure.all
  end

  def new
    @departure = Departure.new
    render 'form'
  end

  def create
    departure = Departure.new(departure_params)
    if departure.save
      redirect_to departures_path
    end
  end

  def destroy_all
    Departure.all.destroy_all
    redirect_to departures_path
  end

  private

  def departure_params
    params.require(:departure).permit(:ship_code, :date, :port_name, :excursion_id, :maximum, :sold)
  end
end
