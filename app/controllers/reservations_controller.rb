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
    # Calcule la durée du séjour en jours (minimum 1 jour)
    duree_sejour = [(reservation.date_fin - reservation.date_debut).to_i, 1].max

    # Tarif journalier selon le service sélectionné
    tarif_journalier = case reservation.service_id
                       when Service.find_by(name: "Chambres haut standing").id
                         30_000
                       when Service.find_by(name: "Studios meublés").id
                         35_000
                       when Service.find_by(name: "Appartements meublés").id
                         45_000
                       else
                         0 # Si le service n'est pas reconnu
                       end

    # Montant total = tarif journalier * durée du séjour
    tarif_journalier * duree_sejour
  end

  def reservation_params
    params.require(:reservation).permit(:service_id, :date_debut, :date_fin, :nb_adulte, :nb_enfant, :montant_a_payer, :mode_paiement)
  end
end
