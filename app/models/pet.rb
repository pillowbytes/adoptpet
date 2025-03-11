class Pet < ApplicationRecord
  has_many_attached :photos
  has_many :orders, dependent: :destroy
  has_many :users, through: :orders
  SPECIES = ["Cachorro", "Gato", "Outros"].freeze
  GENDER = ["Macho", "Fêmea"].freeze

  validates :name, :age, :size, presence: true
  validates :species, presence: true, inclusion: { in: SPECIES, message: "Animal Inválido" }
  validates :gender, presence: true, inclusion: { in: GENDER, message: "Gênero Inválido" }

  scope :available, -> { where(is_available: true) }
end
