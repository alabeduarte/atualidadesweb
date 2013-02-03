require 'spec_helper'
describe News do
  context ".create" do
    it { News.create(feed: create(:feed), url: "http://news.com", keywords: "news", title: "News", subtitle: "...", image: "http://imgae.news.com", featured_leve: 0).should be_true }
  end

  context ".breaking_news" do
    before { 150.times { create(:news) } }
    it "should fetch the most recent news sorted by last id" do
      News.should have(130).breaking_news
    end
  end
end
