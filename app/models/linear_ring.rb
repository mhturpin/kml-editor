class LinearRing < ApplicationRecord
  has_many :coordinates, as: :geometry

  def self.create_from_geojson(coordinates)
    linear_ring = self.create!()

    coordinates.each_with_index do |coordinate, i|
      Coordinate.create_from_geojson(linear_ring, coordinate, i)
    end

    return linear_ring
  end
end
