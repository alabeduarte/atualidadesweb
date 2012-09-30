require 'spec_helper'

describe Timeline do
  let(:repository) { mock(:feed) }

  context "fetching featured news" do
    before do
      feed_1 = feed_with(url: 'http://test1.com', featured_level: 0)
      feed_2 = feed_with(url: 'http://test2.com', featured_level: 0)
      feed_3 = feed_with(url: 'http://test3.com', featured_level: 0)
      feed_4 = feed_with(url: 'http://test4.com', featured_level: 1)

      repository.stub(:all).and_return [feed_1, feed_2, feed_3, feed_4]
      repository.stub(:all).with(featured_level: 0).and_return [feed_1, feed_2, feed_3]

      feed_1.stub(:news).and_return([news(featured_level: 0), news(featured_level: 0)])
      feed_2.stub(:news).and_return([news(featured_level: 0)])
      feed_3.stub(:news).and_return([news(featured_level: 0)])
      feed_4.stub(:news).and_return([news(featured_level: 1)])
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
      feed_1 = feed_with(url: 'http://test1.com', featured_level: 1)
      feed_2 = feed_with(url: 'http://test2.com', featured_level: 2)
      feed_3 = feed_with(url: 'http://test3.com', featured_level: 5)

      repository.stub(:all).and_return [feed_1, feed_2, feed_3]
      repository.stub(:all).with(featured_level: 1).and_return [feed_1]
      feed_1.stub(:news).and_return([news(featured_level: 1)])
      feed_2.stub(:news).and_return([news(featured_level: 2)])
      feed_3.stub(:news).and_return([news(featured_level: 5)])
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
    Timeline.new(repository)
  end

  def feed_with(opts)
    feed = mock(:feed)
    feed.stub(:url).and_return(opts[:url])
    feed.stub(:featured_level).and_return(opts[:featured_level])
    feed
  end

  def news(args)
    News.new(args)
  end

end
