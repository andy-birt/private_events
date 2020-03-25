class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User created!"
      redirect_to @user
    else
      flash[:danger] = "User was not created!"
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
    @event = @user.events.build
    @invite = @event.invites.build
    @upcoming_events = @user.events.upcoming
    @previous_events = @user.events.past
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "User deleted"
    redirect_to signup_path
  end

  private

    def user_params
      params.require(:user).permit(:name, :email)
    end

end
