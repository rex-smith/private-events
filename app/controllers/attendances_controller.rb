class AttendancesController < ApplicationController
  
  def index
    @attendances = Attendance.all
  end

  def show
    @attendance = Attendance.find(params[:id])
  end

  def edit
  end

  def update
  end
  
  def new
  end

  def create
    @event = Event.find(params[:event_id])
    @attendance = Attendance.new(attended_event_id: @event.id, attendee_id: current_user.id)
    respond_to do |format|
      if @attendance.save
        format.html { redirect_to event_url(@event), notice: "Attendance was successfully created." }
        format.json { render :index, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event = Event.find(params[:event_id])
    @attendance = Attendance.find(params[:id])
    @attendance.destroy
    flash[:notice] = "You have successfully canceled your attendance to '#{@event.name}'."
    redirect_to events_path
  end

  
end
