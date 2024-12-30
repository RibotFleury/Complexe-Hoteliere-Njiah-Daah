class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @reservation.montant_a_payer = calculer_montant(@reservation)
    if @reservation.save
      ReservationMailer.new_reservation(@reservation).deliver_now
      redirect_to success_reservations_path
    else
      render :new
    end
  end

  def confirm
    # @reservation = Reservation.find(params[:id])
    # ReservationMailer.confirmation(@reservation).deliver_now
  end

  def success
  end

  private

  def calculer_montant(reservation)
    100.0
  end

  def reservation_params
    params.require(:reservation).permit(:service_id, :date_debut, :date_fin, :nb_adulte, :nb_enfant, :montant_a_payer, :mode_paiement)
  end
end
