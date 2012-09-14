require 'spec_helper'

describe Timeline do
  let(:repository) { mock(:feed) }
  let(:reader) { mock(:reader) }

  before do
    feed_1 = create_feed(url: 'http://test1.com', with_total_news: 3)
    feed_2 = create_feed(url: 'http://test2.com', with_total_news: 6)
    feed_3 = create_feed(url: 'http://test3.com', with_total_news: 7)
    repository.stub(:all).and_return [feed_1, feed_2, feed_3]
    reader.stub(:new).with(anything).and_return(reader)
  end

  it "should retrieve all news from feeds to timeline" do
    timeline = Timeline.new
    news = timeline.load(repository, reader)
    news.size.should == 16
  end

private
  def create_feed(args)
    feed = mock(:feed)
    feed.stub(:url).and_return(args[:url])
    feed.stub(:fetch).and_return(create_news(args[:url], args[:with_total_news]))
    feed
  end

  def create_news(url, total_news)
    list = []
    total_news.times do |n|
      news = mock(:news)
      news.stub(:url).and_return(url)
      list << news
    end
    list
  end
end
