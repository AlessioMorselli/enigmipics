class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]

  # GET /pictures
  def index
    if params[:user_id]
      @uploaded = true
      @pictures = current_user.pictures.order(created_at: :desc)
    else
      @uploaded = false
      @pictures = Picture.all.order(created_at: :desc)
    end
  end

  # GET /pictures/1
  def show
    @votes = @picture.votes
    @user_vote = @votes.find_by(user_id: current_user.id)
  end

  # GET /pictures/new
  def new
    @picture = Picture.new
  end

  # GET /pictures/1/edit
  def edit
  end

  # POST /pictures
  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      redirect_to @picture, notice: 'Immagini condivisa.'
    else
      render :new
    end
  end

  # PATCH/PUT /pictures/1
  def update
    if @picture.update(picture_params)
      redirect_to @picture, notice: 'Immagine aggiornata.'
    else
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def picture_params
      params.require(:picture).permit(:url, :name, :user_id)
    end
end
