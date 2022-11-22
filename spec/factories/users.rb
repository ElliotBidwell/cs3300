FactoryBot.define do
    factory :user do
        email { 'test@gmail.com' }
        password { 'testPassword' }
        password_confirmation { 'testPassword' }
    end
end