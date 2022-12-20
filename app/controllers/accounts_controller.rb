class AccountsController < ApplicationController

    def create
        account = Account.create!(account_params)
        render json: account, status: :created
    end

    def index
        accounts = Account.all
        render json: accounts, status: :ok
    end

    def show
        account = find_params
        render json: account, status: :ok
    end

    # def update
    #     account = find_params
    #     account.withdraw_or_withdraw
    #     render json: account, status: :accepted
    # end

    private

    def account_params
        params.require(:account).permit(:accountNo, :lastKnownBalance, :accountType, :user_id)
    end

    def find_params 
        Account.find(params[:id])
    end

    def edit_params
        params.require(:account).permit(:lastKnownBalance)
    end

end
