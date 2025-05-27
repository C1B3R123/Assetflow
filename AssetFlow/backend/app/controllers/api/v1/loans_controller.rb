# backend/app/controllers/api/v1/loans_controller.rb

module Api
    module V1
      class LoansController < ApplicationController
        before_action :set_loan, only: [:show, :update, :destroy]
  
        # GET /api/v1/loans
        def index
          @loans = Loan.all
          render json: @loans
        end
  
        # GET /api/v1/loans/1
        def show
          render json: @loan
        end
  
        # POST /api/v1/loans
        def create
          @loan = Loan.new(loan_params)
  
          if @loan.save
            render json: @loan, status: :created
          else
            render json: @loan.errors, status: :unprocessable_entity
          end
        end
  
        # PATCH/PUT /api/v1/loans/1
        def update
          if @loan.update(loan_params)
            render json: @loan
          else
            render json: @loan.errors, status: :unprocessable_entity
          end
        end
  
        # DELETE /api/v1/loans/1
        def destroy
          @loan.destroy
          head :no_content
        end
  
        private
          def set_loan
            @loan = Loan.find(params[:id])
          rescue ActiveRecord::RecordNotFound
            render json: { error: 'Loan not found' }, status: :not_found
          end
  
          def loan_params
            params.require(:loan).permit(:asset_id, :loaned_to, :loan_date, :return_date, :expected_return_date, :returned, :notes)
          end
      end
    end
  end