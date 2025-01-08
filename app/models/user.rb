class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reservations, dependent: :destroy
  has_many :commentaires, dependent: :destroy
  validates :telephone, presence: true, format: { with: /\A6\d{8}\z/, message: "doit commencer par 6 et contenir exactement 9 chiffres" }
end
