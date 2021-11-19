class ApplicationController < ActionController::Base
  helper_method :current_account
  helper_method :logged_in?
  helper_method :authorized

  def current_account
    return unless session[:account_id]

    @account = Account.find(session[:account_id])
  end

  def logged_in?
    !current_account.nil?
  end

  def authorized
    redirect_to root_path unless logged_in?
  end
end
