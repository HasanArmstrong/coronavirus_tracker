class HomeController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @confirmed_cases = CoronaCountry.pluck(:country, :confirmed_cases)
  end

  def receive_webhooks
    if request.headers['Content-Type'] == 'application/json'
      data = JSON.parse(request.body.read)
      UpdateCoronaData.new(data).save
    end
  end
end
