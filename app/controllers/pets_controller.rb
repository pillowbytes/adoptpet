class PetsController < ApplicationController

  def show
  @pet = Pet.find(params[:id])
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :age, :species, :gender, :size, :image_url)
  end
end
