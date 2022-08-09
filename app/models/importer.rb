require 'csv'

class Importer
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  attr_accessor :file, :type

  def persisted?
    false
  end

  def initialize(file)
    @file = file
  end

  def run_departures
    table = CSV.parse(File.read(@file), headers: true)
    table.each do |row|
      Departure.create(ship_code: row[0], 
                       date: row[1], 
                       port_name: row[2], 
                       excursion_id: row[3], 
                       maximum: row[4], 
                       sold: row[5])
    end
  end

  def run_departure_warnings
    table = CSV.parse(File.read(@file), headers: true)
    table.each do |row|
      DepartureWarning.create(excursion_id: row[0], 
                       excursion_date: row[1], 
                       port_name: row[2], 
                       excursion_name: row[3], 
                       ship_code: row[4], 
                       percent_sold: row[5])
    end
  end
end