# backend/app/controllers/api/v1/licenses_controller.rb

module Api
    module V1
      class LicensesController < ApplicationController
        before_action :set_license, only: [:show, :update, :destroy]
  
        # GET /api/v1/licenses
        def index
          @licenses = License.all
          render json: @licenses
        end
  
        # GET /api/v1/licenses/1
        def show
          render json: @license
        end
  
        # POST /api/v1/licenses
        def create
          @license = License.new(license_params)
  
          if @license.save
            render json: @license, status: :created
          else
            render json: @license.errors, status: :unprocessable_entity
          end
        end
  
        # PATCH/PUT /api/v1/licenses/1
        def update
          if @license.update(license_params)
            render json: @license
          else
            render json: @license.errors, status: :unprocessable_entity
          end
        end
  
        # DELETE /api/v1/licenses/1
        def destroy
          @license.destroy
          head :no_content
        end
  
        private
          def set_license
            @license = License.find(params[:id])
          rescue ActiveRecord::RecordNotFound
            render json: { error: 'License not found' }, status: :not_found
          end
  
          def license_params
            params.require(:license).permit(:asset_id, :key, :expiration_date, :issued_by, :notes)
          end
      end
    end
  end