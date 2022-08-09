class DepartureWarningsController < ApplicationController
  def index
    @departure_warnings = DepartureWarning.all
  end

  def new
    @departure_warning = DepartureWarning.new
    render 'form'
  end

  def create
    departure_warning = DepartureWarning.new(departure_params)
    if departure_warning.save
      redirect_to departure_warnings_path
    end
  end

  def destroy_all
    DepartureWarning.delete_all
    redirect_to departures_path
  end

  def report
    @report_entries = WarningCalculator.create_report
    render 'report'
  end

  private

  def departure_params
    params.require(:departure).permit(:ship_code, :date, :port_name, :excursion_id, :maximum, :sold)
  end
end
