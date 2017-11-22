class Availability < ApplicationRecord
  belongs_to :user
  has_one :booking
end
