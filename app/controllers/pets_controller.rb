class PetsController < ApplicationController
  before_action :pet_scope, only: [:index]

  def home
    @pets = Pet.all
    @top = Pet.first(10)
  end

  def index
    if params[:animal_type].present?
      @pets = @pets.where(animal_type: params[:animal_type])
    end
    if params[:query].present?
      @pets = @pets.pet_search(params[:query])
    end
    if params[:location].present?
      @pets = @pets.near(params[:location], 10)
    end
    @pets = @pets.where.not(latitude:nil, longitude: nil)
    @markers = @pets.map do |pet|
      {
        lat: pet.latitude,
        lng: pet.longitude,
      }
    end
  end

  def filter_by
  end

  def show
    @pet = Pet.find(params[:id])
    authorize @pet
  end

  def new
    @pet = Pet.new
    authorize @pet
  end

  def show
    @pet = Pet.find(params[:id])
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

  def pet_scope
    @pets = policy_scope(Pet)
  end
end
