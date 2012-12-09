class ScheduleController < ApplicationController
  respond_to :html
  
  def index
    @apartments = Apartment.to_revisit.order('next_revisit ASC')
    respond_with(@apartments)
  end
end
