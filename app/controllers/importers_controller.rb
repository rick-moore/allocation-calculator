class ImportersController < ApplicationController
  def new
    @importer = Importer.new(nil)
    render 'form'
  end

  def create
    @importer = Importer.new(importer_params[:file])
    case importer_params[:type]
    when 'departure'
      @importer.run_departures  
      redirect_to departures_path
    when 'departure_warning'
      @importer.run_departure_warnings
      redirect_to departure_warnings_path  
    end
  end

  private

  def importer_params
    params.require(:importer).permit(:file, :type)
  end
end