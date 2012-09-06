FactoryGirl.define do
  factory :feed do
    sequence(:host) {|n| "http://#{n}host.com" }
    selector '#news'
    url_pattern 'a'
    title '.title'
    subtitle '.subtitle'
    image_source 'img'
  end
end
