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
    idx = 0
    CSV.foreach(file) do |row|
      if idx > 0
        Departure.create(ship_code: row[0], date: row[1], port_name: row[2], excursion_id: row[3], maximum: row[4], sold: row[5])
      end
      idx += 1
    end
  end
end