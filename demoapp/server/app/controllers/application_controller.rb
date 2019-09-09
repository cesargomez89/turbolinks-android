class ApplicationController < ActionController::Base
  before_action :check_session
  def current_user
    User.find_by(id: session[:user_id])
  end

  private

  def check_session
    unless current_user
      @session = Session.new
      render 'home/login'
    end
  end
end
