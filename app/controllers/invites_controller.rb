class InvitesController < ApplicationController

  def index
    @user = User.find_by(name: session[:name])
    @invites = Invite.find_by(user_id: @user.id)
  end

  def new
    @user = User.find_by(name: session[:name])
    @users = User.all
  end

  def create
    @event = Event.find(params[:invite][:event_id])
    @invite = @event.invites.build(invite_params)
    if @invite.save
      redirect_to @event
    else
      render "new"
    end
  end

  def show
    @user = User.find_by(name: session[:name])
  end

  def update
    @invite = Invite.find(params[:id])
    @invite.update_attribute(:accepted, true)
    if @invite.save
      puts "Yes"
      redirect_to "/invites"
    else
      puts "No"
      redirect_to root_url
    end
  end

  private

    def invite_params
      params.require(:invite).permit(:user_id, :event_id)
    end

end
