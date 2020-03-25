class EventsController < ApplicationController

  def index
    @user = User.find_by(name: session[:name])
    @upcoming_events = Event.upcoming
    @previous_events = Event.past
  end

  def create
    @user = User.find_by(name: session[:name])
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
    @user = User.find_by(name: session[:name])
    @event = Event.find_by(id: params[:id])
  end

  private

    def event_params
      params.require(:event).permit(:name, :description, :date)
    end

end
