class User::DashboardController < ApplicationController
  def show
    @user = User.first
    @events = current_user.events
  end
end
