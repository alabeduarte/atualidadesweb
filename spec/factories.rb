FactoryGirl.define do
  factory :news_feed do
    sequence(:host) {|n| "http://#{n}host.com" }
    selector '#news'
    url_pattern 'a'
    title '.title'
    subtitle '.subtitle'
    image_source 'img'
  end
end
