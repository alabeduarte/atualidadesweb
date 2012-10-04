FactoryGirl.define do
  factory :feed do
    sequence(:url) {|n| "http://somenews.com/#{n}" }
    sequence(:host) {|n| "http://somenews.com/#{n}" }
    sequence(:featured_level) {|n| n}
    selector '#news'
    url_pattern 'a'
    title '.title'
    limit 5
  end
end
