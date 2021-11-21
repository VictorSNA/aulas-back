require 'rails_helper'

feature 'Admin delete product' do
  scenario 'successfuly' do
    account = create(:account, permission: 'admin')
    product = create(:product)
    product2 = create(:product, code: '1000', title: 'Banana verde')

    visit accounts_path

    fill_in 'Email', with: account.email
    fill_in 'Senha', with: account.password
    click_on 'Entrar'

    visit products_path
    click_link(product2.code)
    click_on 'Deletar'

    expect(page).to have_content('Produto deletado com sucesso')
    expect(current_path).to eq(products_path)
    expect(page).to_not have_content(product2.title)
  end
end
