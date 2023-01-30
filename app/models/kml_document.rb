class KmlDocument < ApplicationRecord
  has_many :placemarks

  def self.create_from_geojson(geojson)
    kml_document = self.create!(name: geojson.original_filename)
    data = JSON.parse(File.read(geojson.tempfile)).with_indifferent_access

    if data[:type] == 'FeatureCollection'
      data[:features].each do |feature|
        kml_document.placemarks << Placemark.create_from_geojson(feature)
      end
    end

    return kml_document
  end
end
