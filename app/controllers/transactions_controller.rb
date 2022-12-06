class TransactionsController < ApplicationController

    rescue_from ActiveRecord::RecordNotUnique, with: :render_not_unique_entity_response

    # Create a new transaction
    def create
        transaction = Transaction.create!(transaction_params)
        render json: transaction, status: :created
    end

    # Update transaction by ID
    def update
        transaction = find_params
        transaction.update!(edit_params)
        render json: transaction, status: :accepted
    end

    # Get all transactions
    def index
        transactions = Transaction.all
        render json: transactions, status: :ok
    end

    private

    # Params for creating a new transaction
    def transaction_params
        params.require(:transaction).permit(:uniqueReference, :amount, :status, :transactionType, :account_id)
    end

    # Render not unique response from the database
    def render_not_unique_entity_response(exception)
        render json: { errors: ["unique reference already exists"] }, status: :unprocessable_entity
    end

    # Find transaction by ID
    def find_params 
        Transaction.find(params[:id])
    end

    # Params for editing a transaction
    def edit_params
        params.require(:transaction).permit(:status)
    end

end

