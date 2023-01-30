class Polygon < ApplicationRecord
  belongs_to :outer_boundary, class_name: 'LinearRing'
  has_many :polygon_inner_boundaries
  has_many :inner_boundaries, through: :polygon_inner_boundaries, source: 'linear_ring'

  def self.create_from_geojson(geometry)
    # First coordinate array is the outer boundary, remainder (if they exist) are the inner boundaries
    polygon = self.create!(outer_boundary: LinearRing.create_from_geojson(geometry[:coordinates].shift))
    polygon.inner_boundaries = geometry[:coordinates].map { |coordinate_array| LinearRing.create_from_geojson(coordinate_array) }
    return polygon
  end
end
