class UsersController < ApplicationController
  def show
    if params[:id]
      @user = User.find(params[:id])
      @events = @user.created_events.all
    else
      @events = current_user.created_events.all
    end
  end
end
