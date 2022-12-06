class AccountsController < ApplicationController

    def create
        account = Account.create!(account_params)
        render json: account, status: :created
    end

    private

    def account_params
        params.require(:account).permit(:accountNo, :lastKnownBalance, :accountType, :user_id)
    end

end
