module UsersHelper
  def upcoming_events(user)
    events = user.attended_events.where("date > ?", Time.now)
  end

  def previous_events(user)
    events = user.attended_events.where("date < ?", Time.now)
  end
end
