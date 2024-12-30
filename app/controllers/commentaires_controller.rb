class CommentairesController < ApplicationController
  before_action :authenticate_user!

  def new
    @commentaire = Commentaire.new
  end

  def create
    @commentaire = Commentaire.new(commentaire_params)
    @commentaire.user = current_user
    if @commentaire.save
      CommentaireMailer.new_commentaire(@commentaire).deliver_now
      redirect_to comment_success_path
    else
      render :new
    end
  end

  def success
  end

  private

  def commentaire_params
    params.require(:commentaire).permit(:contenu, :service_id)
  end
end
