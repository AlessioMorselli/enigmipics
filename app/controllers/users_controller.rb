class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
  end

  # GET /register
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /register
  def create
    @user = User.new(user_params)

    if @user.save
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  # PATCH/PUT /users/1
  def update
    if current_user.update(user_params)
      redirect_to current_user
    else
      flash.now[:danger] = 'Informazioni non aggiornate.'
      render 'edit'
    end
  end

  # DELETE /users/1
  def destroy
    current_user.pictures.each do |p|
      p.user_id = nil
      p.save
    end
    current_user.saved_pictures.each do |sp|
      sp.destroy
    end
    current_user.boards.each do |b|
      b.destroy
    end
    current_user.votes.each do |v|
      v.destroy
    end

    current_user.destroy
    log_out
    
    flash.now[:success] = 'Utente eliminato.'
    render 'new'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :password)
    end
end
