FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    surname               {Faker::Name.last_name}
    first_name            {Faker::Name.first_name}
    read_surname          {'ヤマダ'}
    read_first_name       {'タロウ'}
    birthday              {Faker::Date.birthday(min_age: 5, max_age: 90)}
  end
end