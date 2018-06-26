class SavedPicturesController < ApplicationController
  before_action :set_saved_picture, only: [:show, :edit, :update, :destroy]

  # GET pictures/1/saved_pictures/new
  def new
    @saved_picture = SavedPicture.new
    @picture = Picture.find(params[:picture_id])
  end

  # POST pictures/1/saved_pictures
  def create
    @saved_picture = SavedPicture.new(saved_picture_params)

    if @saved_picture.save
      redirect_to user_board_path(current_user, saved_picture_params[:board_id]), notice: 'Immagine salvata.'
    else
      render :new
    end
  end

  # DELETE users/1/boards/1/saved_pictures/1
  def destroy
    bid = @saved_picture.board_id
    @saved_picture.destroy
    redirect_to user_board_path(current_user, bid), notice: 'Immagine cancellata.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_saved_picture
      @saved_picture = SavedPicture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def saved_picture_params
      params.require(:saved_picture).permit(:description, :board_id, :picture_id)
    end
end
