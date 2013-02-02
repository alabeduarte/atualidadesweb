require 'spec_helper'
describe News do
  context ".create" do
    it { News.create(feed: create(:feed), url: "http://news.com", keywords: "news", title: "News", subtitle: "...", image: "http://imgae.news.com", featured_leve: 0).should be_true }
  end

  context ".breaking_news" do
    before { 99.times { create(:news) } }
    it "should fetch the most recent news sorted by last id" do
      breaking_news = News.breaking_news
      breaking_news.size.should == 50
      breaking_news[0].url.should == "http://somenews.com/100"
      breaking_news[1].url.should == "http://somenews.com/99"
      breaking_news[2].url.should == "http://somenews.com/98"
    end
  end
end
