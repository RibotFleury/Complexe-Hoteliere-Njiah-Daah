class CommentaireMailer < ApplicationMailer
  default from: 'njiahdaah.hotel@gmail.com'

  def new_commentaire(commentaire)
    @commentaire = commentaire
    mail(
      to: 'njiahdaah.hotel@gmail.com',
      subject: 'Nouveau Commentaire sur un service'
    ) do |format|
      format.html
    end
  end
end
