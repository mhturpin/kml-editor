class Placemark < ApplicationRecord
  belongs_to :geometry, polymorphic: true

  def self.create_from_geojson(feature)
    placemark = self.new
    placemark.name = feature[:properties][:DisplayPlantName]
    placemark.description = "<h1>Properties:</h1><ul>#{feature[:properties].map {|k, v| "<li>#{k}: #{v}</li>"}.join}</ul>"

    case feature[:geometry][:type]
    when 'Point'
      placemark.geometry = Point.create_with(feature[:geometry][:coordinates][1], feature[:geometry][:coordinates][0])
    end

    placemark.save!
    return placemark
  end
end
