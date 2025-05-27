# app/controllers/api/v1/notifications_controller.rb
class Api::V1::NotificationsController < ApplicationController
  def expiring_licenses
    # Licenses expiring in the next 30 days
    @expiring_licenses = License.where('expiration_date <= ?', Date.current + 30.days).order(:expiration_date)
    render json: @expiring_licenses, include: :asset # Include asset details if needed
  end
end