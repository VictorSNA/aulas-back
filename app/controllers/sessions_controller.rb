class SessionsController < ApplicationController
  def create
    @account = Account.find_by(email: params[:email])
    if @account && (@account.password == params[:senha])
      session[:account_id] = @account.id
      session[:account_name] = @account.name
      redirect_to accounts_path
    else
      redirect_to accounts_path
    end
  end

  def new; end
end
