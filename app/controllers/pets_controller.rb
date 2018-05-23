class PetsController < ApplicationController
  def home
    @pets = Pet.all
    @top = Pet.first(10)
  end

  def index
    @pets = policy_scope(Pet)
  end

  def show
    @pet = Pet.find(params[:id])
    authorize @pet
  end

  def filter_by
  end

  def new
    @pet = Pet.new
    authorize @pet
  end

  def create
    @pet = Pet.new(pet_params)
    # @pet.home_stay = @pet.home_stay.to_s == "true"
    # @pet.take_away = @pet.take_away.to_s == "true"
    # @pet.adoptable = @pet.adoptable.to_s == "true"
    @pet.user = current_user
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render :new
    end
    authorize @pet
  end

  def edit
    @pet = Pet.find(params[:id])
    authorize @pet
  end

  def update
    @pet = Pet.find(params[:id])
    authorize @pet
    if @pet.update(pet_params)
      redirect_to pet_path(@pet)
    else
      render :new
    end
  end

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :animal_type, :breed, :take_away, :home_stay, :age, :photo, :photo_cache, :location, :description, :adopatable)
  end
end
