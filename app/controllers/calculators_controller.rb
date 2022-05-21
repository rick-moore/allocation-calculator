class CalculatorsController < ApplicationController
  def new
    @calculator = Calculator.new(nil, nil)
    render 'form'
  end

  def create
    @calculator = Calculator.new(calculator_params[:date], calculator_params[:ship_code])
    @calculator.run!
    render 'results'
  end

  private
  
  def calculator_params
    params.require(:calculator).permit(:date, :ship_code)
  end
end