require 'spec_helper'

describe Timeline do
  let(:repository) { mock(:feed) }
  let(:reader) { mock(:reader) }

  before do
    reader.stub(:new).with(anything).and_return(reader)
  end

  context "fetching featured news" do
    before do
      feed_1 = feed_with('http://test1.com', [news(featured_level: 0), news(featured_level: 0)])
      feed_2 = feed_with('http://test2.com', [news(featured_level: 0)])
      feed_3 = feed_with('http://test3.com', [news(featured_level: 0)])
      feed_4 = feed_with('http://test4.com', [news(featured_level: 1)])

      repository.stub(:all).and_return [feed_1, feed_2, feed_3, feed_4]
      repository.stub(:all).with(featured_level: 0).and_return [feed_1, feed_2, feed_3]
    end

    it "should fetch featured news" do
      timeline = build_timeline
      timeline.featured_news.size.should == 4
    end

    it "featured level should be 0" do
      timeline = build_timeline
      timeline.featured_news.each {|n| n.featured_level.should == 0}
    end
  end

  context "fetching plain news" do
    before do
      feed_1 = feed_with('http://test1.com', [news(featured_level: 1)])
      feed_2 = feed_with('http://test2.com', [news(featured_level: 2)])
      feed_3 = feed_with('http://test3.com', [news(featured_level: 5)])

      repository.stub(:all).and_return [feed_1, feed_2, feed_3]
      repository.stub(:all).with(featured_level: 1).and_return [feed_1]
    end

    it "should fetch plain news" do
      timeline = build_timeline
      timeline.plain_news.size.should == 1
    end

    it "featured level should be 1" do
      timeline = build_timeline
      timeline.plain_news.each {|n| n.featured_level.should == 1}
    end
  end

  private
  def build_timeline
    Timeline.new(repository, reader)
  end

  def feed_with(url, news)
    feed = mock(:feed)
    feed.stub(:url).and_return(url)
    feed.stub(:fetch).and_return(news)
    feed
  end

  def news(args)
    News.new(args)
  end

#   let(:repository) { mock(:feed) }
#   let(:reader) { mock(:reader) }
#
#   before do
#     feed_1 = create_feed(url: 'http://test1.com', with_total_news: 3)
#     feed_2 = create_feed(url: 'http://test2.com', with_total_news: 6)
#     feed_3 = create_feed(url: 'http://test3.com', with_total_news: 7)
#     repository.stub(:all).and_return [feed_1, feed_2, feed_3]
#     reader.stub(:new).with(anything).and_return(reader)
#   end
#
#   it "should retrieve all news from feeds to timeline" do
#     timeline = Timeline.new
#     news = timeline.load(repository, reader)
#     news.size.should == 16
#   end
#
# private
#   def create_feed(args)
#     feed = mock(:feed)
#     feed.stub(:url).and_return(args[:url])
#     feed.stub(:fetch).and_return(create_news(args[:url], args[:with_total_news]))
#     feed
#   end
#
#   def create_news(url, total_news)
#     list = []
#     total_news.times do |n|
#       news = mock(:news)
#       news.stub(:url).and_return(url)
#       list << news
#     end
#     list
#   end
end
