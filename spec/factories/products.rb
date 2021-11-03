FactoryBot.define do
  factory :product do
    code { 'TESTE9999' }
    title { 'Produto de Teste 9999' }
    description { 'Teste' }
    price { 100.00 }
    quantity { 2000 }
    category { 'TESTEPRODUTO' }
  end
end
