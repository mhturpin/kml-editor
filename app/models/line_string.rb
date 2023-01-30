class LineString < ApplicationRecord
  has_many :coordinates, foreign_key: 'geometry_id'
end
