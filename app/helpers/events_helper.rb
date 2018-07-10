module EventsHelper
  def add_attendee
    event = Event.find_by(id: params[:event])
    user = User.find_by(id: params[:user])
    event.attendees << user
    flash[:success] = "Attended #{event.title}"
    redirect_to root_url
  end
end
