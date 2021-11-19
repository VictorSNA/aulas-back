require 'rails_helper'

feature 'Anonymous search product' do
  scenario 'successfuly' do
    product = create(:product, title: 'Jade')

    visit root_path

    fill_in 'searchField', with: 'Jade'
    click_on 'Pesquisar'

    expect(page).to have_content('1 produto foi encontrado')
    expect(page).to have_content(product.title)
  end
end

