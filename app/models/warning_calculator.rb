class WarningCalculator
  
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  def persisted?
    false
  end

  def initialize(date, ship_code)
    @date = date.instance_of?(String) ? Time.parse(date) : nil
    @ship_code = ship_code
  end

  def self.create_report
    report = DepartureWarning.unique_excursion_ids.to_a.each_with_object({}) do |id, report|
      dw = DepartureWarning.find_by(excursion_id: id)
      num = DepartureWarning.where(excursion_id: id).select('distinct excursion_date').count
      report[num] = "#{id};#{dw.excursion_name};#{dw.port_name};#{dw.ship_code};#{num}"
    end
    report.sort{ |a,b| b <=> a }.map{ |entry| entry[1] }
  end
end