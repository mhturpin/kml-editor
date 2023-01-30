class Point < ApplicationRecord
  has_one :placemark, as: :geometry
  has_one :coordinate, foreign_key: 'geometry_id'

  def self.create_with(latitude, longitude)
    point = self.create!()
    point.coordinate = Coordinate.create!(geometry_id: point.id, latitude: latitude, longitude: longitude)
    return point
  end
end
