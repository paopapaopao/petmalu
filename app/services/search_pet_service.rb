class SearchPetService < ApplicationService
  def initialize(params)
    @params = params
  end

  def call
    Petfinder.configure do |config|
      config.api_key = ENV['API_KEY']
      config.api_secret = ENV['API_SECRET']
    end
    petfinder = Petfinder::Client.new
    # petfinder = Petfinder::Client.new(ENV['API_KEY'], ENV['API_SECRET'])
  end
end
