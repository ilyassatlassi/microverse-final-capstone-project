class Doctor < ApplicationRecord
  has_many :reservations, dependent: :destroy

  validates :name, :specialization, :consultation_fee, :hospital, :description, presence: true, length: { minimum: 3, maximum: 50 }
  validates :availability, inclusion: { in: [true, false] }
end