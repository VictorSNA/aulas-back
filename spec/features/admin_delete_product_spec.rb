require 'rails_helper'

feature 'Admin delete product' do
  scenario 'successfuly' do
    product = create(:product)

    visit root_path

    click_on 'Produtos'
    click_on product.title
    click_on 'Deletar'

    expect(page).to have_content('Produto deletado com sucesso')
    expect(current_path).to eq(products_path)
    expect(page).to_not have_content(product.title)
  end
end


