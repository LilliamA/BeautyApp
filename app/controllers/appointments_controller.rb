class AppointmentsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @user = User.find(params[:user_id])
    @appointment = @user.appointments.build
    authorize @appointment, :new?
  end


  def create
    @user = User.find(params[:user_id])
    @appointment = @user.appointments.build(appointments_params)
    authorize @appointment
    respond_to do |format|
      if @appointment.save
        format.html { redirect_to user_path(@user.id) }
      else
        format.html { redirect_to landing_path }
      end
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @appointment = @user.appointments.find(params[:id])
    authorize @appointment
  end

  def update
    @user = User.find(params[:user_id])
    @appointment = @user.appointments.find(params[:id])
    respond_to do |format|
      if @appointment.update(appointments_params)
        authorize @appointment
        format.html { redirect_to @user  }
      else
        format.html { redirect_to landing_path }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @appointment = @user.appointments.find(params[:id])
    @appointment.destroy
    authorize @user
    redirect_to @user 
  end

  private

  def appointments_params
    params.require(:appointment).permit(:date, :title)
  end
end
