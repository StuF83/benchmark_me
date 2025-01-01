class User::DashboardController < ApplicationController
  def show
    @user = User.first
  end
end
