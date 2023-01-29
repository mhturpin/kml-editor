class KmlDocument < ApplicationRecord


  def self.from_geojson
    data = test_data

    result = {}

    if data[:type] == 'FeatureCollection'
      data[:features].each do |feature|
        create_placemark(feature)
      end

      return result
    else
      return {}
    end
  end

  def self.test_data
    return {
      type: 'FeatureCollection',
      features: [
        {
          type: 'Feature',
          geometry: {
            type: 'Point',
            coordinates: [-93.6180718438514, 44.85437034225967]
          },
          properties: {
            AccNumQual: '19780339',
            CommonName: 'Japanese Flowering Quince',
            DisplayPlantName: '<em>Chaenomeles japonica</em>',
            LocationPlaceName: 'Shrub Collections',
            SourceDisplayNameNew: 'Jewell Nurseries, Inc.',
            FormName: 'plant'
          }
        },
        {
          type: 'Feature',
          geometry: {
            type: 'Point',
            coordinates: [-93.61865724063468, 44.853894813702965]
          },
          properties: {
            AccNumQual: '20080422',
            CommonName: 'Japanese Flowering Quince',
            DisplayPlantName: '<em>Chaenomeles japonica</em> Super Red<sup>&reg;</sup>',
            LocationPlaceName: 'Shrub Collections',
            SourceDisplayNameNew: 'Monrovia Nursery',
            FormName: 'container'
          }
        },
        {
          type: 'Feature',
          properties: {
            STATEFP: '36',
            STUSPS: 'NY',
            NAME: 'New York',
            TEMP: -20,
            ZONE: '5a'
          },
          geometry: {
            type: 'MultiPolygon',
            coordinates: [
              [
                [
                  [-73.7802, 45.003],
                  [-73.7805, 45.0022],
                  [-73.7849, 45.003],
                  [-73.7802, 45.003]
                ]
              ],
              [
                [
                  [-73.7862, 45.003],
                  [-73.7874, 44.9992],
                  [-73.7931, 45.0002],
                  [-73.7971, 44.9882],
                  [-73.8027, 44.9891],
                  [-73.8041, 44.9852],
                  [-73.8097, 44.9861],
                  [-73.811, 44.9821],
                  [-73.8448, 44.9878],
                  [-73.8435, 44.9918],
                  [-73.8604, 44.9946],
                  [-73.859, 44.9986],
                  [-73.8647, 44.9996],
                  [-73.864, 45.0014],
                  [-73.8153, 45.0025],
                  [-73.8116, 45.0025],
                  [-73.8031, 45.0027],
                  [-73.8026, 45.0028],
                  [-73.8022, 45.0028],
                  [-73.7923, 45.003],
                  [-73.7893, 45.003],
                  [-73.7862, 45.003]
                ]
              ]
            ]
          }
        },
        {
          type: 'Feature',
          properties: {
            STATEFP: '36',
            STUSPS: 'NY',
            NAME: 'New York',
            TEMP: -25,
            ZONE: '4b'
          },
          geometry: {
            type: 'Polygon',
            coordinates: [
              [
                [-73.5089, 44.7161],
                [-73.4865, 44.7122],
                [-73.4906, 44.7003],
                [-73.4962, 44.7012],
                [-73.4989, 44.6933],
                [-73.5045, 44.6942],
                [-73.5058, 44.6903],
                [-73.5338, 44.6951],
                [-73.5325, 44.699],
                [-73.5381, 44.7],
                [-73.5367, 44.704],
                [-73.5423, 44.7049],
                [-73.5396, 44.7129],
                [-73.534, 44.7119],
                [-73.5284, 44.711],
                [-73.5271, 44.715],
                [-73.5159, 44.713],
                [-73.5103, 44.7121],
                [-73.5089, 44.7161]
              ]
            ]
          }
        }
      ]
    }
  end
end
