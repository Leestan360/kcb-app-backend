class TransactionsController < ApplicationController

    # Create a new transaction associated with an acoount
    # The transaction only goes through if the account lastKnownBalance will not go below 0
    def create
        account = Account.find(params[:account_id])
        @transaction = account.transactions.create(transaction_params)
        if account.lastKnownBalance >= @transaction.amount
            account.update_with_transaction(@transaction)
            render json: @transaction, status: :created
        else
            render json: { errors: ["insufficient balance"] }, status: :unprocessable_entity
        end
    end

    # Update transaction by ID
    # The status is updated
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

    # Get one transaction by ID
    def show
        transaction = find_params
        render json: transaction, status: :ok
    end

    private

    # Params for creating a new transaction
    def transaction_params
        params.require(:transaction).permit(:uniqueReference, :account_number, :amount, :status, :transactionType, :account_id)
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

