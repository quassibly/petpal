class BookingsController < ApplicationController
  def show
    authorize @booking
    @user = current_user
    @booking = Booking.find(@user)
  end

  def new
    @booking = Booking.new
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
    @booking.update(booking_params)
    if @booking.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def destroy
    @booking.find(params[:id])
    @booking.destroy
    redirect_to user_path(current_user)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
