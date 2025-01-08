class Service < ApplicationRecord
  has_many :commentaires, dependent: :destroy
end
