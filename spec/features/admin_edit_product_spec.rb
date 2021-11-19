require 'rails_helper'

feature 'Admin edit product' do
  scenario 'successfuly' do
    account = create(:account, permission: 'admin')
    product = create(:product)

    visit accounts_path

    fill_in 'Email', with: account.email
    fill_in 'Senha', with: account.password
    click_on 'Entrar'

    visit products_path

    click_link(product.code)
    click_on 'Editar'
    fill_in 'Código', with: 'CODIGODETESTE'
    fill_in 'Título', with: 'Mesa de ping-pong'
    fill_in 'Descritivo', with: 'Diversão garantida'
    fill_in 'Valor', with: 2000.99
    fill_in 'Quantidade', with: 5000
    fill_in 'Categoria', with: 'Jogos'
    click_on 'Enviar'

    expect(page).to have_content('Produto editado com sucesso')
    expect(page).to have_content('Mesa de ping-pong')
  end
end

