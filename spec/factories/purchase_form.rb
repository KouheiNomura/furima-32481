FactoryBot.define do
  factory :purchase_form do
    address = Gimei.address
    postal_code   { '123-4567' }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    city          { address.city.kanji }
    address       { address.town.kanji }
    building      { '柳ビル103' }
    phone_number  { '09012345678' }
    token         { 'tok_abcdefghijk00000000000000000' }
  end
end
