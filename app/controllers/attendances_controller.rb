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
    @attendance = current_user.build(attendance_params)
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
    @attendance = Attendance.find(params[:id])
    @event = @attendance.attended_event
    @attendance.destroy
    flash[:notice] = "You have successfully canceled your attendance to '#{@event.name}'."
    redirect_to events_path
  end

  private

  def attendance_params
    params.require(:attendance).permit(:attendee_id, :attended_event_id)
  end

end
