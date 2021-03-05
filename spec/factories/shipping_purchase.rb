FactoryBot.define do
  factory :shipping_purchase do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    municipality  { '東京都' }
    address       { '1-1' }
    building      { '東京ハイツ' }
    phone_number  { '29066665555' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
