class HomeController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    file = File.read('lib/countries.json')
    file = JSON.parse(file)
    @confirmed_cases = CoronaCountry.pluck(:country, :confirmed_cases)
  end

  def receive_webhooks
    binding.pry
    if request.headers['Content-Type'] == 'application/json'
      data = JSON.parse(request.body.read)
      UpdateCoronaData.new(data).save
    end
  end
end
