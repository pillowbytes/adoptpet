class Order < ApplicationRecord
  belongs_to :user
  belongs_to :pet

  validates :children_number, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
  validates :family_agreement, inclusion: { in: [true, false] }
  validates :other_pets_in_house, inclusion: { in: [true, false] }
  validates :responsible_for_pet, presence: true, length: { maximum: 255 }
  validates :house_type, presence: true, inclusion: { in: %w[Casa Apartamento Sítio],
                                                      message: "Tipo de casa inválido" }
  validates :house_description, presence: true, length: { minimum: 5, maximum: 1000 }
end
