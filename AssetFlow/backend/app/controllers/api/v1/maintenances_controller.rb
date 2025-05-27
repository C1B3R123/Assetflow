# backend/app/controllers/api/v1/maintenances_controller.rb

module Api
    module V1
      class MaintenancesController < ApplicationController
        before_action :set_maintenance, only: [:show, :update, :destroy]
  
        # GET /api/v1/maintenances
        def index
          @maintenances = Maintenance.all
          render json: @maintenances
        end
  
        # GET /api/v1/maintenances/1
        def show
          render json: @maintenance
        end
  
        # POST /api/v1/maintenances
        def create
          @maintenance = Maintenance.new(maintenance_params)
  
          if @maintenance.save
            render json: @maintenance, status: :created
          else
            render json: @maintenance.errors, status: :unprocessable_entity
          end
        end
  
        # PATCH/PUT /api/v1/maintenances/1
        def update
          if @maintenance.update(maintenance_params)
            render json: @maintenance
          else
            render json: @maintenance.errors, status: :unprocessable_entity
          end
        end
  
        # DELETE /api/v1/maintenances/1
        def destroy
          @maintenance.destroy
          head :no_content
        end
  
        private
          def set_maintenance
            @maintenance = Maintenance.find(params[:id])
          rescue ActiveRecord::RecordNotFound
            render json: { error: 'Maintenance not found' }, status: :not_found
          end
  
          def maintenance_params
            params.require(:maintenance).permit(:asset_id, :maintenance_date, :description, :cost, :performed_by, :notes)
          end
      end
    end
  end