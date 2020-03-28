class UpdateCoronaData
  def initialize(data)
    @data = data
  end

  def save
    @data['Countries'].each do |hash| CoronaCountry.find_by(country: hash['Country']).update(confirmed_cases: hash['TotalConfirmed'], confirmed_deaths: hash['TotalDeaths']) end
  end
end
