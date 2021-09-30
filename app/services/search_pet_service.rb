class SearchPetService < ApplicationService
  def initialize(params)
    @params = params
  end

  def call
    pets, pagination = Petfinder::Client.new.animals(params: @params)

    pets
  end
end
