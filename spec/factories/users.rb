FactoryBot.define do
  factory :user do
    nickname              { 'taro' }
    email                 { Faker::Internet.free_email }
    password              { 'a' + '0' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
    surname               { '山田' }
    first_name            { '太郎' }
    read_surname          { 'ヤマダ' }
    read_first_name       { 'タロウ' }
    birthday              { Faker::Date.birthday(min_age: 5, max_age: 90) }
  end
end
