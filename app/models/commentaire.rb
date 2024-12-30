class Commentaire < ApplicationRecord
  belongs_to :user
  belongs_to :service
  validates :contenu, presence: true
end
