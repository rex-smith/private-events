class UsersController < ApplicationController
  def show
    @events = @user.created_events
  end
end
