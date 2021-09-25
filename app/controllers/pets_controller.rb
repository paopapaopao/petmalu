class PetsController < ApplicationController
  def search
    @search_pet = SearchPetService.call('hi')
  end
end
