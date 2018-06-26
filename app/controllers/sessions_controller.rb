class SessionsController < ApplicationController
  # GET /login
  def new
  end

  # POST /login
  def create
    user = User.find_by(username: params[:session][:username])

    if user && (user.password == params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Username e/o password errati'
      render 'new'
    end
  end

  # DELETE /logout
  def destroy
    log_out
    redirect_to login_path
  end
end
