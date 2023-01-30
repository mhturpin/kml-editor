class PolygonInnerBoundary < ApplicationRecord
  belongs_to :polygon
  belongs_to :linear_ring
end
