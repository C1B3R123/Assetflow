# app/models/asset.rb
class Asset < ApplicationRecord
    enum asset_type: { software: 0, hardware: 1, vehicle: 2, furniture: 3 }
    enum status: { active: 0, in_maintenance: 1, retired: 2 }
  
    has_many :licenses # Will be added later
    has_many :loans # Will be added later
    has_many :maintenances # Will be added later
  
    validates :name, presence: true
    validates :asset_type, presence: true
    validates :status, presence: true
  end