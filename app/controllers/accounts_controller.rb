class AccountsController < ApplicationController
  def index
    if session[:account_id]
      @account = Account.find(session[:account_id])
    end
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)

    if @account.save
      session[:account_id] = @account.id
      session[:account_name] = @account.name
      flash[:alert] = 'Por favor, verifique o seu endereço de e-mail para confirmar sua conta'
      flash[:notice] = 'Cadastro com sucesso'
      redirect_to accounts_path
    end
  end

  private

  def account_params
    params
      .require(:account)
      .except(:password_confirmation)
      .permit(
        :name,
        :email,
        :password,
        :cpf,
        :telephone,
        :cep,
        :public_place,
        :address,
        :address_number,
        :complement,
        :password_confirmation
        )
  end
end
