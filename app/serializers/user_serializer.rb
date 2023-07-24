class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :nickname, :image, :role, :reservations

  def reservations
    object.reservations
  end
end
