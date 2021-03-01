FactoryBot.define do
  factory :item do
    product_name       { '野菜' }
    description        { 'おいしい' }
    category_id        { 2 }
    product_status_id  { 2 }
    shipping_charge_id { 2 }
    prefecture_id      { 2 }
    shipping_date_id   { 2 }
    price              { 999999 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
