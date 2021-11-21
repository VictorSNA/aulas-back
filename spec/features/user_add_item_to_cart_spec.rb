require 'rails_helper'

feature 'Admin add item to cart' do
  scenario 'successfuly' do
    account = create(:account, permission: 'costumer')
    product = create(:product)

    visit accounts_path

    fill_in 'Email', with: account.email
    fill_in 'Senha', with: account.password
    click_on 'Entrar'

    visit root_path

    click_on 'Plantas'
    click_on 'Vitrine de Plantas'
    click_link("detalhe-#{product.code}")
    click_on 'Adicionar ao carrinho'
    click_on 'Ver carrinho'

    expect(Cart.last.product_id).to eq(product.id)
    expect(page).to have_content(product.title)
    expect(page).to have_content(product.price)
  end
end
