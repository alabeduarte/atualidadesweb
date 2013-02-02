require 'spec_helper'
describe News do
  it "should save news" do
    News.create(feed: Factory(:feed), url: "http://news.com", keywords: "news", title: "News", subtitle: "...", image: "http://imgae.news.com", featured_leve: 0).should be_true
  end
end
