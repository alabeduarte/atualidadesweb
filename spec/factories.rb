FactoryGirl.define do

  factory :news do
    sequence(:url) {|n| "http://somenews.com/#{n}" }
    sequence(:created_at) { |n| Time.utc(2013, 1, 1) + (n-1).day }
  end

end
