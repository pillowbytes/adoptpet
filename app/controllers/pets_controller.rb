class PetsController < ApplicationController

  def index
    @pets = Pet.all
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet.update(pet_params)
  end

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
