class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    if @reservation.save
      redirect_to confirm_reservations_path
    else
      render :new
    end
  end

  def confirm
  end

  def success
  end

  private

  def reservation_params
    params.require(:reservation).permit(:service_id, :date_debut, :date_fin, :nb_adulte, :nb_enfant, :montant_a_payer, :mode_paiement)
  end
end
