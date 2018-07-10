class EventsController < ApplicationController
  include EventsHelper

  def create
    @event = current_user.created_events.build(event_params)
    @event.date = @event.date.to_time
    @event.save
    flash[:success] = 'Event Created'
    redirect_to root_url
  end

  def show
    @event = Event.find_by(id: params[:id])
  end

  def new
    if logged_in?
      @event = current_user.created_events.build
    else
      flash[:danger] = 'Please login first'
      redirect_to login_path
    end
  end

  def index
    @events = Event.all
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :date)
  end
end
