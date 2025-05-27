# backend/app/controllers/api/v1/assets_controller.rb

module Api
    module V1
      class AssetsController < ApplicationController
        before_action :set_asset, only: [:show, :update, :destroy]
  
        # GET /api/v1/assets
        def index
          @assets = Asset.all
          render json: @assets
        end
  
        # GET /api/v1/assets/1
        def show
          render json: @asset
        end
  
        # POST /api/v1/assets
        def create
          @asset = Asset.new(asset_params)
  
          if @asset.save
            render json: @asset, status: :created
          else
            render json: @asset.errors, status: :unprocessable_entity
          end
        end
  
        # PATCH/PUT /api/v1/assets/1
        def update
          if @asset.update(asset_params)
            render json: @asset
          else
            render json: @asset.errors, status: :unprocessable_entity
          end
        end
  
        # DELETE /api/v1/assets/1
        def destroy
          @asset.destroy
          head :no_content # Retorna 204 No Content
        end
  
        private
          def set_asset
            @asset = Asset.find(params[:id])
          rescue ActiveRecord::RecordNotFound
            render json: { error: 'Asset not found' }, status: :not_found
          end
  
          def asset_params
            params.require(:asset).permit(:name, :asset_type, :description, :serial_number,
                                         :purchase_date, :purchase_price, :current_value, :status, :notes)
          end
      end
    end
  end