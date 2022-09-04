class CreateDepartureWarnings < ActiveRecord::Migration[6.1]
  def change
    create_table :departure_warnings do |t|
      t.integer :excursion_id
      t.date :excursion_date
      t.string :port_name
      t.string :excursion_name
      t.string :ship_code
      t.float :percent_sold

      t.timestamps
    end
  end
end
