class PetsController < ApplicationController

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet.update(pet_params)
    redirect_to pet_path(@pet)
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :age, :species, :gender, :size, :image_url)
  end
end
