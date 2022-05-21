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
    @total_maximum = departures.map(&:maximum).reduce :+
    @total_sold = departures.map(&:sold).reduce :+
    @tour_codes_count = departures.map(&:excursion_id).uniq.count
  end
end