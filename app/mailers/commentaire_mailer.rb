class CommentaireMailer < ApplicationMailer
  default from: 'fleurytene@gmail.com'

  def new_commentaire(commentaire)
    @commentaire = commentaire
    mail(
      to: 'fleurytene@gmail.com',
      subject: 'Nouveau Commentaire sur un service'
    ) do |format|
      format.html
    end
  end
end
