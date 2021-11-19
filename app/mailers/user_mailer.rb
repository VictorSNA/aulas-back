class UserMailer < ApplicationMailer
  default from: ENV['SMTP_EMAIL']

  def welcome_email
    mail(to: ENV['SMTP_EMAIL'], subject: 'welcome')
  end
end
