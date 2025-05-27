# app/models/license.rb
class License < ApplicationRecord
  belongs_to :asset
  validates :key, presence: true
  validates :expiration_date, presence: true
  # Add validation to ensure asset is of type 'software' if necessary,
  # or handle this logic in the frontend/controller when creating/updating.
end