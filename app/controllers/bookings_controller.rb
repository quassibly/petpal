class BookingsController < ApplicationController

  def index
    @bookings = Booking.where(:user_id == current_user)
    @bookings = policy_scope(Booking)
  end

  def show
    if params[:pet_id].nil?
    user_id = params[:user_id]
    pet_id = params[:pet_id]
    @booking = Booking.find_by(user_id: user_id, pet_id: pet_id )

  else
    user_id = params[:user_id]
    pet_id = params[:pet_id]
    @booking = Booking.find_by(user_id: user_id, pet_id: pet_id)
  end
    skip_authorization

  end

  def new
    @booking = Booking.new
    @pet = params[:pet_id]
    skip_authorization
  end

  def create
    skip_authorization
    # getting input from the form which is not simple_form_for
    booking_date_str = booking_params[:booking_date]
    booking_date = booking_date_str.split(" to ")
    @booking = Booking.new(start_date: booking_date[0], end_date: booking_date[1])
    @booking.user_id = current_user.id
    pet_id = params[:pet_id]
    @booking.pet_id = pet_id
    if @booking.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def edit
    pet_id = params[:pet_id]
    @booking = Booking.find_by(user_id: current_user.id, pet_id: pet_id )
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
    redirect_to user_path(current_user)
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
  
  private

  # sanitizer params coming via form
  def booking_params
    params.require(:booking).permit(:booking_date)
  end

end
