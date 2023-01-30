# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_01_29_220617) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "geometry", ["Point", "LineString", "LinearRing", "Polygon", "MultiGeometry"]

  create_table "coordinates", force: :cascade do |t|
    t.enum "geometry_type", null: false, enum_type: "geometry"
    t.bigint "geometry_id", null: false
    t.string "latitude", null: false
    t.string "longitude", null: false
    t.integer "index"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kml_documents", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "line_strings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "linear_rings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "multi_geometries", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "multi_geometry_geometries", force: :cascade do |t|
    t.bigint "multi_geometry_id", null: false
    t.enum "geometry_type", null: false, enum_type: "geometry"
    t.bigint "geometry_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["multi_geometry_id"], name: "index_multi_geometry_geometries_on_multi_geometry_id"
  end

  create_table "placemarks", force: :cascade do |t|
    t.bigint "kml_document_id"
    t.string "name"
    t.string "description"
    t.string "style_url"
    t.enum "geometry_type", enum_type: "geometry"
    t.bigint "geometry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kml_document_id"], name: "index_placemarks_on_kml_document_id"
  end

  create_table "points", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "polygon_inner_boundaries", force: :cascade do |t|
    t.bigint "polygon_id", null: false
    t.bigint "linear_ring_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["linear_ring_id"], name: "index_polygon_inner_boundaries_on_linear_ring_id"
    t.index ["polygon_id"], name: "index_polygon_inner_boundaries_on_polygon_id"
  end

  create_table "polygons", force: :cascade do |t|
    t.bigint "outer_boundary_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
