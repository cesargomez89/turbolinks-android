class SessionsController < ApplicationController
  before_action :find_user, only: :create
  skip_before_action :check_session, only: :create

  def create
    if @user&.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:error] = 'Invalid user or password'
      render 'home/login'
    end
  end

  private

  def find_user
    @session = Session.new(session_params)
    @user    = User.find_by(email: @session.email)
  end

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
