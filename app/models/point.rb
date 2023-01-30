class Point < ApplicationRecord
  has_one :placemark, as: :geometry
  has_one :coordinate, as: :geometry

  def self.create_from_geojson(geometry)
    point = self.create!()
    Coordinate.create_from_geojson(point, geometry[:coordinates])
    return point
  end
end
