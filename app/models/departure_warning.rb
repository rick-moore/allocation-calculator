class DepartureWarning < ApplicationRecord
  scope :over_fifty_percent, -> { where('percent_sold >= 50') }

  def self.unique_excursion_ids
    Set.new(pluck(:excursion_id))
  end
end
