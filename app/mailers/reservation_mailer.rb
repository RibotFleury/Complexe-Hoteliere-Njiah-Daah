class ReservationMailer < ApplicationMailer
  default from: 'fleurytene@gmail.com'
  def new_reservation(reservation)
    @reservation = reservation
    mail(
      to: 'fleurytene@gmail.com',
      subject: 'Nouvelle réservation'
    ) do |format|
      format.html
    end
  end
end
