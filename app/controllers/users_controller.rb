class UsersController < ApplicationController
  def show
    @user = current_user
    @bookings = Booking.where(:user_id == @user)
    authorize @user
  end

 # def edit
  #  @booking = Booking.find(params[:id])
 #   @user = current_user
 # end

# def edit
 #   @user = User.find(params[:id])
 # end

  # def update
  #   @user = User.find(params[:id])
  #   @user.update(user_params)
  #   if @user.save
  #     redirect_to user_path(@user)
  #   else
  #     render :new
  #   end
  # end

private
  def user_params
    params.require(:user).permit(:name, :email)
  end

end
