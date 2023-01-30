class Placemark < ApplicationRecord
  belongs_to :geometry, polymorphic: true

  def self.create_from_geojson(feature)
    placemark = self.new
    placemark.name = feature[:properties][:DisplayPlantName]
    placemark.description = "<h1>Properties:</h1><ul>#{feature[:properties].map { |k, v| "<li>#{k}: #{v}</li>" }.join}</ul>"

    case feature[:geometry][:type]
    when 'Point'
      placemark.geometry = Point.create_from_geojson(feature[:geometry])
    when 'Polygon'
      placemark.geometry = Polygon.create_from_geojson(feature[:geometry])
    when 'MultiPolygon'
      placemark.geometry = MultiPolygon.create_from_geojson(feature[:geometry])
    end

    placemark.save!
    return placemark
  end
end
