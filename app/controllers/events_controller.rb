class EventsController < ApplicationController
  def index
    @events = Event.all.order('date ASC')
  end
end
