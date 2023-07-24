class DoctorSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :specialization, :consultation_fee, :hospital,
              :availability, :description, :facebook, :instagram, :twitter, :reservations

  def reservations
    object.reservations
  end
end
