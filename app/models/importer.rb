require 'csv'

class Importer
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  attr_accessor :file

  def persisted?
    false
  end

  def initialize(file)
    @file = file
  end

  def run!
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
end