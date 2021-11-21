FactoryBot.define do
  factory :cart do
    sessionid { "MyString" }
    user_id { 1 }
    product_id { 1 }
    quantity { 1 }
    unit_value { 1.5 }
    total { 1.5 }
  end
end
