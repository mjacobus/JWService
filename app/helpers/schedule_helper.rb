module ScheduleHelper
  def schedule_date_class(date)
    if date.class == Apartment
      date = date.next_revisit
    end
    
    if date.nil?
      return 'warning'
    end
    
    days = (date.to_date - Date.today).to_i

    if days <= 1
      'error text-error'
    elsif  days > 7
      'success text-success'
    else
      'warning text-warning'
    end
  end
end
