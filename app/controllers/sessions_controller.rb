class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(name: params[:session][:name].downcase)
    if @user
      session[:name] = @user.name
      flash[:success] = "Logged in."
      redirect_to @user
    else
      flash[:danger] = "Name not registered."
      render "new"
    end
  end

  def destroy
    params[:session] = nil
    session[:name] = nil
    redirect_to root_url
  end

end
