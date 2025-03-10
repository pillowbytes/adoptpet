class PetsController < ApplicationController
  def index
    # Pet.where(is available = true)
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id]) # & status available = true
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)

    if @pet.save
      redirect_to pet_path(@pet), notice: "Amiguinho Criado!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])
    @pet.update(pet_params)
    redirect_to pet_path(@pet)
  end

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy
    redirect_to pets_path
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :age, :species, :gender, :size, :image_url)
  end
end
