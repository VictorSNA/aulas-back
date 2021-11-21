class UserMailer < ApplicationMailer
  default from: ENV['SMTP_EMAIL']

  def welcome_email
    mail(to: ENV['SMTP_EMAIL'], subject: 'welcome')
  end

  def reset_password
    @account = params[:account]
    mail(to: @account.email, subject: 'Sua senha')
  end
end
