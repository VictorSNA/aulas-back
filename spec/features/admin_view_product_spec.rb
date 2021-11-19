require 'rails_helper'

feature 'Admin view product' do
  scenario 'successfuly' do
    account = create(:account, permission: 'admin')
    product = create(:product)

    visit accounts_path

    fill_in 'Email', with: account.email
    fill_in 'Senha', with: account.password
    click_on 'Entrar'

    visit root_path

    click_on 'Plantas'
    click_on 'Vitrine de Plantas'
    click_link(product.code)

    expect(page).to have_content(product.title)
    expect(page).to have_content(product.price)
  end
end

feature 'Admin view all products' do
  scenario 'successfuly' do
    product = create(:product)

    visit products_path

    expect(page).to have_content(product.title)
    expect(page).to have_content(product.price)
  end
end

