FactoryBot.define do
  factory :account do
    name { "MyString" }
    email { "example@email.com" }
    password { "MyString" }
    cpf { "MyString" }
    telephone { "MyString" }
    cep { "MyString" }
    public_place { "MyString" }
    address { "MyString" }
    address_number { "MyString" }
    complement { "MyString" }
    permission { "costumer" }
  end
end
