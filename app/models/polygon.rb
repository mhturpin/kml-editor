class Polygon < ApplicationRecord
  has_many :polygon_inner_boundaries
  has_many :inner_boundaries, through: :polygon_inner_boundaries, source: 'linear_ring'
end
