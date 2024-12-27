class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true
      t.date :date_debut
      t.date :date_fin
      t.boolean :statut
      t.integer :nb_adulte
      t.integer :nb_enfant
      t.decimal :montant_a_payer
      t.string :mode_paiement

      t.timestamps
    end
  end
end
