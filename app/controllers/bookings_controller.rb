class BookingsController < ApplicationController

  def index
    @bookings = Booking.where(:user_id == current_user)
    @bookings = policy_scope(Booking)


  end

  def show
    skip_authorization
    if params[:id].nil?
    user_id = params[:user_id]
    pet_id = params[:pet_id]
    @booking = Booking.find_by(user_id: user_id, pet_id: pet_id)
  elsif params[:id] != nil && params[:pet_id] != nil
    user_id = params[:user_id]
    pet_id = params[:pet_id]
    @booking = Booking.find_by(user_id: user_id, pet_id: pet_id)
  else
    user_id = params[:user_id]
    pet_id = params[:id]
    @booking = Booking.find_by(user_id: user_id, pet_id: pet_id)
  end


  end

  def new
    @booking = Booking.new
    @pet = params[:pet_id]
    skip_authorization
  end

  def create
    skip_authorization
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    pet_id = params[:pet_id]
    @booking.pet_id = pet_id
    if @booking.save
      redirect_to confirm_booking_path(@booking)
    else
      render :new
    end
  end

  def edit
    user_id = params[:user_id]
    pet_id = params[:pet_id]
    @booking = Booking.find_by(user_id: user_id, pet_id: pet_id )
    skip_authorization
  end

  def update
    @booking = Booking.find(params[:id])
    skip_authorization
    @booking.update(booking_params)
    if @booking.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def destroy
    user_id = params[:user_id]
    pet_id = params[:pet_id]
    @booking = Booking.find_by(user_id: user_id, pet_id: pet_id)
    skip_authorization
    @booking.destroy
    redirect_to cancelled_booking_path
  end


  def accept
    pet_id = params[:pet_id]
    user_id = params[:user_id]
    @booking = Booking.find_by(user_id: user_id, pet_id: pet_id )
    skip_authorization
    @booking.status = "Accepted"
    @booking.save
    redirect_to user_booking_path(id: pet_id, user_id: user_id)
  end

  def cancelled
    skip_authorization
  end

  def confirmation
    @booking = Booking.find(params[:id])
  skip_authorization
  end
  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user_id, :pet_id)
  end

end
