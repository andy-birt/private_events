class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def create
    @user = User.find_by(name: session[:name])
    puts @user
    @event = @user.events.build(event_params)
    if @event.save
      flash[:success] = "Event created!"
      redirect_to @event
    else
      flash[:danger] = "Something is wrong!"
      redirect_back(fallback_location: root_url)
    end
  end

  def show
    @event = Event.find_by(id: params[:id])
  end

  private

    def event_params
      params.require(:event).permit(:description)
    end

end
