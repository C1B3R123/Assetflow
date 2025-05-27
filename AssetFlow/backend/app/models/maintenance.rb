# app/models/maintenance.rb
class Maintenance < ApplicationRecord
  belongs_to :asset
  validates :maintenance_date, presence: true
  validates :description, presence: true
end