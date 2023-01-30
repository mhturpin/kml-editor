# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

kml_document = KmlDocument.create!(name: 'Test KML Document')

# Add a Point
point = Point.create!()
Coordinate.create!(geometry_id: point.id, latitude: '44.85437034225967', longitude: '-93.6180718438514')
placemark = Placemark.create!(geometry_id: point.id, geometry_type: 'Point')
kml_document.placemarks << placemark

# Add a LineString
line_string = LineString.create!()
# line_string.coordinates = []
placemark = Placemark.create!(geometry_id: line_string.id, geometry_type: 'LineString')
kml_document.placemarks << placemark

# Add a LinearRing
linear_ring = LinearRing.create!()
# linear_ring.coordinates = []
placemark = Placemark.create!(geometry_id: linear_ring.id, geometry_type: 'LinearRing')
kml_document.placemarks << placemark

# Add a Polygon
outer_boundary = LinearRing.create!()
polygon = Polygon.create!(outer_boundary_id: outer_boundary.id)
# polygon.inner_boundaries = []
placemark = Placemark.create!(geometry_id: polygon.id, geometry_type: 'Polygon')
kml_document.placemarks << placemark

# Add a MultiGeometry
multi_geometry = MultiGeometry.create!()
placemark = Placemark.create!(geometry_id: multi_geometry.id, geometry_type: 'MultiGeometry')
kml_document.placemarks << placemark
