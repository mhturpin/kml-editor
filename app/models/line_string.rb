class LineString < ApplicationRecord
  has_many :coordinates, as: :geometry
end
