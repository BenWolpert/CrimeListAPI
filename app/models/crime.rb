class Crime < ApplicationRecord
  validates :Title, presence: true
  validates :Latitude, presence: true
  validates :Longitude, presence: true
  validates :Description, presence: true
  validates :CrimeDateTime, presence: true
end
