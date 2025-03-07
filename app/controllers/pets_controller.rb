class PetsController < ApplicationController

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.save
    redirect_to pet_path(@pet)
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :age, :species, :gender, :size, :image_url)
  end
end
