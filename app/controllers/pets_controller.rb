class PetsController < ApplicationController
  def index
    filters = params[:filters] || {}
    # @pets = Pet.where(is_available: true)
    @pets = Pet.all

    @pets = @pets.where(species: filters[:species]) if filters[:species].present?
    @pets = @pets.where(gender: filters[:gender]) if filters[:gender].present?
    @pets = @pets.where(size: filters[:size]) if filters[:size].present?

    if filters[:age_range].present?
      min_age, max_age = parse_age_range(filters[:age_range])
      @pets = @pets.where("age >= ?", min_age) if min_age.present?
      @pets = @pets.where("age <= ?", max_age) if max_age.present?
    end
  end

  def show
    @pet = Pet.find(params[:id]) # & status available = true

    respond_to do |format|
      format.html
      format.turbo_stream do
        render partial: 'pets/pet_show', locals: { pet: @pet }
      end
    end
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
    params.require(:pet).permit(:name, :age, :species, :gender, :size, :description, photos: [])
  end

  def parse_age_range(range)
    case range
    when "0-1"
      [0, 1]
    when "2-5"
      [2, 5]
    when "6+"
      [6, nil]
    else
      [nil, nil]
    end
  end
end
