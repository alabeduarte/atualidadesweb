require 'spec_helper'

describe Timeline do
  let(:repository) { mock(:news_feed) }

  before do
    feed_1 = create_feed(url: 'http://test1.com', with_total_news: 3)
    feed_2 = create_feed(url: 'http://test2.com', with_total_news: 6)
    feed_3 = create_feed(url: 'http://test3.com', with_total_news: 7)
    repository.stub(:all).and_return [feed_1, feed_2, feed_3]
  end

  it "should retrieve all news from feeds to timeline" do
    timeline = Timeline.new(repository)
    news = timeline.all
    news.size.should == 16
  end

  it "should get news from specific feed url to timeline" do
    timeline = Timeline.new(repository)
    news = timeline.get('http://test1.com')
    news.size.should == 3
  end

  it "should not get news when url feed does not exist" do
    timeline = Timeline.new(repository)
    news = timeline.get('http://xxx.com')
    news.should be_empty
  end

private
  def create_feed(args)
    feed = mock(:news_feed)
    feed.stub(:host).and_return(args[:url])
    feed.stub(:fetch).and_return(create_news(args[:url], args[:with_total_news]))
    feed
  end

  def create_news(url, total_news)
    list = []
    total_news.times do |n|
      news = mock(:news)
      news.stub(:host).and_return(url)
      list << news
    end
    list
  end
end
