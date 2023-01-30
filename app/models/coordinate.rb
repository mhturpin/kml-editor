class Coordinate < ApplicationRecord
  belongs_to :geometry, polymorphic: true

  default_scope { order(:index) }

  def self.create_from_geojson(geometry, coordinate, index=nil)
    return self.create!(geometry: geometry, latitude: coordinate[1], longitude: coordinate[0], index: index)
  end
end
