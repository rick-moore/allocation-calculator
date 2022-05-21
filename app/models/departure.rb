class Departure < ApplicationRecord
  validates :ship_code,
            :date,
            :port_name,
            :excursion_id,
            :maximum,
            :sold,
            presence: true

  def date=(value)
    value = parse_date(value)
    super(value)
  end

  def formatted_date
    date.strftime('%m/%d/%Y')
  end

  private

  def parse_date(date)
    date_array = date.split('/')
    month = date_array[0].to_i
    day = date_array[1].to_i
    year = date_array[2].to_i

    Date.new(year, month, day)
  end
end
