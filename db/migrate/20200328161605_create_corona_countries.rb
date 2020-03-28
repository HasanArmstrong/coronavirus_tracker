class CreateCoronaCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :corona_countries do |t|
      t.string :country
      t.string :confirmed_cases
      t.string :confirmed_deaths

      t.timestamps
    end
  end
end
