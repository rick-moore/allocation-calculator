class Calculator
  
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  
  attr_accessor :date
  attr_accessor :ship_code
  attr_accessor :total_maximum
  attr_accessor :total_sold
  attr_accessor :tour_codes_count
  
  def persisted?
    false
  end

  def initialize(date, ship_code)
    @date = date.instance_of?(String) ? Time.parse(date) : nil
    @ship_code = ship_code
  end

  def run!
    departures = Departure.where(date: @date, ship_code: @ship_code)
    calculate_total_maximum(departures)
    calculate_total_sold(departures)
    calculate_unique_tour_codes(departures)
  end

  def calculate_total_maximum(departures)
    @total_maximum = departures.map(&:maximum).inject { |sum, n| sum + n }
  end

  def calculate_total_sold(departures)
    @total_sold = departures.map(&:sold).inject { |sum, n| sum + n }
  end

  def calculate_unique_tour_codes(departures)
    @tour_codes_count = departures.map(&:excursion_id).uniq.count
  end
end