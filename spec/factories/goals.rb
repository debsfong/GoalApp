FactoryGirl.define do
  factory :goal do
    user_id 1
    title "be more awesome"
    details "be more awesome every day"
    privacy false
    completed false
  end
end
