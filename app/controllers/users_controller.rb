class UsersController < ApplicationController
  def index
    @users = User.all
    authorize User
  end

  def new
    @user = User.new
    authorize @user
  end

  def create
    @user = User.new_with_password(user_params)
    authorize @user
    respond_to do |format|
      if @user.save
      UserMailer.welcome_email(@user).deliver_now
        format.html { redirect_to @user }
      else
        format.html { redirect_to landing_path }
      end
    end
  end

  def show
    @user = User.find(params[:id])
    authorize @user
    @appointments = @user.appointments
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        authorize @user
        format.html { redirect_to @user }
      else
        format.html { redirect_to landing_path }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    authorize @user
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:email, :role)
  end
end
