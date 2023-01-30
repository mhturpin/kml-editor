class CreateGeometryTypes < ActiveRecord::Migration[7.0]
  def change
    create_enum :geometry, ['Point', 'LineString', 'LinearRing', 'Polygon', 'MultiGeometry']

    create_table :placemarks do |t|
      t.references :kml_document
      t.string :name
      t.string :description
      t.string :style_url
      t.enum :geometry_type, enum_type: 'geometry'
      t.bigint :geometry_id
      t.timestamps
    end

    create_table :points do |t|
      t.timestamps
    end

    create_table :line_strings do |t|
      t.timestamps
    end

    create_table :linear_rings do |t|
      t.timestamps
    end

    create_table :polygons do |t|
      t.bigint :outer_boundary_id, null: false
      t.timestamps
    end

    create_table :polygon_inner_boundaries do |t|
      t.references :polygon, null: false
      t.references :linear_ring, null: false
      t.timestamps
    end

    create_table :multi_geometries do |t|
      t.timestamps
    end

    create_table :multi_geometry_geometries do |t|
      t.references :multi_geometry, null: false
      t.enum :geometry_type, enum_type: 'geometry', null: false
      t.bigint :geometry_id, null: false
      t.timestamps
    end

    create_table :coordinates do |t|
      t.enum :geometry_type, enum_type: 'geometry', null: false
      t.bigint :geometry_id, null: false
      t.string :latitude, null: false
      t.string :longitude, null: false
      t.integer :index
      t.timestamps
    end
  end
end
