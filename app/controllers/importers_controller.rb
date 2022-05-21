class ImportersController < ApplicationController
  def new
    @importer = Importer.new(nil)
    render 'form'
  end

  def create
    @importer = Importer.new(importer_params[:file])
    @importer.run!
    redirect_to departures_path
  end

  private

  def importer_params
    params.require(:importer).permit(:file)
  end
end