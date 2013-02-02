require 'spec_helper'
describe News do
  context ".create" do
    it { News.create(feed: create(:feed), url: "http://news.com", keywords: "news", title: "News", subtitle: "...", image: "http://imgae.news.com", featured_leve: 0).should be_true }
  end

  context ".breaking_news" do
    before { 100.times { create(:news) } }
    it { News.breaking_news.size.should == 50 }
  end
end
