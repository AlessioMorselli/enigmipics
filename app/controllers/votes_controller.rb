class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :edit, :update, :destroy]

  # POST pictures/votes
  def create
    @vote = Vote.new(vote_params)

    if @vote.save
      redirect_to picture_path(@vote.picture_id), notice: 'Voto aggiunto'
    else
      redirect_to picture_path(params[:picture_id]), notice: 'Voto non aggiunto'
    end
  end

  # PATCH/PUT pictures/votes/1
  def update
    if @vote.update(vote_params)
      redirect_to picture_path(@vote.picture_id), notice: 'Voto aggiornato.'
    else
      redirect_to picture_path(@vote.picture_id), notice: 'Voto non aggiornato.'
    end
  end

  # DELETE pictures/votes/1
  def destroy
    pid = @vote.picture_id
    @vote.destroy
    redirect_to picture_path(pid), notice: 'Voto cancellato.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote
      @vote = Vote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vote_params
      params.require(:vote).permit(:stars, :picture_id, :user_id)
    end
end
