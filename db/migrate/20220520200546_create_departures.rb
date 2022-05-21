class CreateDepartures < ActiveRecord::Migration[6.1]
  def change
    create_table :departures do |t|
      t.string :ship_code
      t.date :date
      t.string :port_name
      t.integer :excursion_id
      t.integer :maximum
      t.integer :sold
      t.timestamps
    end
  end
end
