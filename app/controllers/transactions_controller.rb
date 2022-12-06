class TransactionsController < ApplicationController

    rescue_from ActiveRecord::RecordNotUnique, with: :render_not_unique_entity_response

    def create
        transaction = Transaction.create!(transaction_params)
        render json: transaction, status: :created
    end

    private

    def transaction_params
        params.require(:transaction).permit(:uniqueReference, :amount, :status, :transactionType, :account_id)
    end

    def render_not_unique_entity_response(exception)
        render json: { errors: ["unique reference already exists"] }, status: :unprocessable_entity
    end

end

