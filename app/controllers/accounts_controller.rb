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

  def reset_password; end

  def send_email_password
    account = Account.find_by_email(params[:email])

    if account && UserMailer.with(account: account).reset_password.deliver_now
      return redirect_to accounts_path, notice: 'Email enviado com sucesso'
    end

    redirect_to accounts_path, alert: 'Email não cadastrado'
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
