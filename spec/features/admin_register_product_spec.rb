require 'rails_helper'

feature 'Admin register product' do
  scenario 'successfuly' do

    visit root_path
    click_on 'Produtos'
    click_on 'Registrar produto'
    fill_in 'Código', with: 'INFAN0001'
    fill_in 'Título', with: 'Bebê conforto'
    fill_in 'Descritivo', with: 'Super confortável com máxima segurança'
    fill_in 'Valor', with: 13.99
    fill_in 'Quantidade', with: 5000
    fill_in 'Categoria', with: 'Infantil'
    click_on 'Enviar'

    expect(page).to have_content('Produto registrado com sucesso')
    expect(page).to have_content('Bebê conforto')
  end
end
