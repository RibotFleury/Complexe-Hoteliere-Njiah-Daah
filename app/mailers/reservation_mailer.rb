class ReservationMailer < ApplicationMailer
  default from: 'njiahdaah.hotel@gmail.com'
  def new_reservation(reservation)
    @reservation = reservation
    mail(
      to: 'njiahdaah.hotel@gmail.com',
      subject: 'Nouvelle réservation'
    ) do |format|
      format.html
    end
  end
end
