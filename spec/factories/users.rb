FactoryGirl.define do
  factory :user do
    email "factory@rails.com"
    password "rails_framework"
    is_admin true
  end

  factory :invalid_admin, class: User do
    email "non_admin@rails.com"
    password "rails_framework"
    is_admin true
  end

  factory :non_admin, class: User do
    email "non_admin1@rails.com"
    password "rails_framework"
    is_admin false
  end

  factory :unauthorized_user, class: User do
    email "non_admin1@rails.com"
    password "rails_framework"
    is_admin false
  end
end
