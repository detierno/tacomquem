module LendsHelper
  
  def reminder_counter(lend)
    reminders = lend.reminders
    content_tag(:span, reminders.count, :class => "badge badge-error") if reminders.count > 0
  end
  
end
