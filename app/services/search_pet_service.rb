class SearchPetService < ApplicationService
  def initialize(params)
    @params = params
    @params.compact!
    @params.delete_if { |k, v| v == '' }
  end

  def call
    pets, pagination = Petfinder::Client.new.animals(params: @params)

    photos_full = pets.map do |pet|
      pet.primary_photo_cropped &&= pet.primary_photo_cropped.full
      pet.primary_photo_cropped || 'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/65761296352685.5eac4787a4720.jpg'
    end

    [pets, photos_full]
  end
end
