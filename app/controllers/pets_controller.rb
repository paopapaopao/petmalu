class PetsController < ApplicationController
  def search
    @pets = SearchPetService.call(
      {
        type: params[:type],
        breed: params[:breed],
        size: params[:size],
        gender: params[:gender],
        age: params[:age],
        color: params[:color],
        coat: params[:coat],
        name: params[:name],
        organization: params[:organization],
        good_with_children: params[:good_with_children],
        good_with_dogs: params[:good_with_dogs],
        good_with_cats: params[:good_with_cats],
        house_trained: params[:house_trained],
        declawed: params[:declawed],
        special_needs: params[:special_needs],
        location: params[:location],
        distance: params[:distance],
        sort: params[:sort],

        # default: 20, max: 100
        limit: 20
      }
    )
  end
end
