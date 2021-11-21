require 'rails_helper'

feature 'User create account' do
  scenario 'successfuly' do
    account = create(:account)

    visit root_path
    click_link('conta')

    fill_in 'Email', with: account.email
    fill_in 'Senha', with: account.password

    click_on 'Entrar'

    expect(page).to have_content("Bem-vindo de volta #{account.name}")
  end
end
