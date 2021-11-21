require 'rails_helper'

feature 'Admin require email password resetation' do
  scenario 'successfuly' do
    copy = double()
    copy2 = double()
    allow(UserMailer).to receive(:with).and_return(copy)
    allow(copy).to receive(:reset_password).and_return(copy2)
    allow(copy2).to receive(:deliver_now).and_return(true)

    account = create(:account, permission: 'costumer')
    product = create(:product)

    visit accounts_path
    click_on 'Esqueci minha senha'
    fill_in 'Email', with: account.email
    click_on 'Enviar email'

    expect(page).to have_content("Email enviado com sucesso")
  end
end
