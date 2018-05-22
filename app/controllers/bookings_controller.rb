class BookingsController < ApplicationController

  def index
    @bookings = Booking.where(:user_id == current_user)
    @bookings = policy_scope(Booking)


  end

  def show
    @booking = policy_scope(Booking).find(params[:id])
    @user = current_user
    authorize @booking
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @pet = Pet.find(params[:pet_id])
    @booking = Booking.new(booking_params)
    @user = current_user
    @booking.user_id = @user.id
    @booking.pet_id = @pet_id
    if @booking.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.update(booking_params)
    if @booking.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def destroy
    @booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to user_path(current_user)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
