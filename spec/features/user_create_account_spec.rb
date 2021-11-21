require 'rails_helper'

feature 'User create account' do
  scenario 'successfuly' do
    visit root_path
    click_link('conta')

    click_link('novaConta')
    fill_in 'Nome', with: "Batman"
    fill_in 'Email', with: "teste@tech.com"
    fill_in 'Senha', with: '123456'
    fill_in 'Confirmação Senha', with: '123456'
    fill_in 'CPF', with: '100.000.000-90'
    fill_in 'Telefone', with: '+55 11 99000-0000'
    fill_in 'CEP', with: '00000-000'
    fill_in 'Logradouro', with: 'Avenida'
    fill_in 'Endereço', with: 'Brasil'
    fill_in 'Número', with: '1000'
    fill_in 'Complemento', with: 'Bloco Y'

    click_on 'Cadastrar'

    expect(page).to have_content('Cadastro com sucesso')
    expect(page).to have_content('Por favor, verifique o seu endereço de e-mail para confirmar sua conta')
    expect(page).to have_content('Batman')
  end
end
