document.addEventListener("turbo:load", function () {
  const serviceSelect = document.getElementById("reservation_service_id");
  const montantField = document.getElementById("reservation_montant_a_payer");
  const dateDebut = document.getElementById("reservation_date_debut");
  const dateFin = document.getElementById("reservation_date_fin");
  const reserverButton = document.getElementById("reserver");

  // 💰 Fonction pour obtenir le tarif journalier selon le service
  const getTarifJournalier = () => {
    const selectedService =
      serviceSelect.options[serviceSelect.selectedIndex].text;
    switch (selectedService) {
      case "Chambres haut standing":
        return 30000;
      case "Studios meublés":
        return 35000;
      case "Appartements meublés":
        return 45000;
      default:
        return 0;
    }
  };

  // 📆 Fonction pour calculer la durée du séjour en jours
  const getDureeSejour = () => {
    if (dateDebut.value && dateFin.value) {
      const startDate = new Date(dateDebut.value + "T00:00:00");
      const endDate = new Date(dateFin.value + "T00:00:00");
      const duree = (endDate - startDate) / (1000 * 60 * 60 * 24); // Conversion en jours
      return Math.max(1, duree); // Minimum 1 jour
    }
    return 1;
  };

  // 🔄 Fonction pour mettre à jour le montant total
  const updateMontant = () => {
    const tarifJournalier = getTarifJournalier();
    const dureeSejour = getDureeSejour();
    const montantTotal = tarifJournalier * dureeSejour;

    montantField.value = montantTotal;
  };

  // ⚡ Mettre à jour le montant dès le chargement si les champs sont remplis
  if (
    serviceSelect &&
    serviceSelect.value &&
    dateDebut.value &&
    dateFin.value
  ) {
    updateMontant();
  }

  // 🛠 Mettre à jour le montant lorsqu'on change de service ou de dates
  serviceSelect.addEventListener("change", updateMontant);
  dateDebut.addEventListener("change", updateMontant);
  dateFin.addEventListener("change", updateMontant);

  // ✅ Vérification des dates avant soumission
  const checkDates = () => {
    if (!dateDebut.value || !dateFin.value) {
      alert("Veuillez sélectionner des dates valides.");
      return false;
    }

    const startDate = new Date(dateDebut.value + "T00:00:00");
    const endDate = new Date(dateFin.value + "T00:00:00");
    const today = new Date();
    today.setHours(0, 0, 0, 0);

    if (startDate < today || endDate < today) {
      alert("Les dates ne peuvent pas être des dates passées.");
      return false;
    }

    if (startDate > endDate) {
      alert("La date d'arrivée ne peut pas être après la date de départ.");
      return false;
    }

    return true;
  };

  // 🚀 Validation avant soumission
  reserverButton.addEventListener("click", function (event) {
    if (!checkDates()) {
      event.preventDefault();
    }
  });
});
