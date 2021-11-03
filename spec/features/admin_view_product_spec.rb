require 'rails_helper'

feature 'Admin view product' do
  scenario 'successfuly' do
    product = create(:product)

    visit root_path

    click_on 'Produtos'
    click_on product.title

    expect(page).to have_content(product.code)
    expect(page).to have_content(product.title)
    expect(page).to have_content(product.description)
    expect(page).to have_content(product.price)
    expect(page).to have_content(product.quantity)
    expect(page).to have_content(product.category)
  end
end


