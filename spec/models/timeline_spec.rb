require 'spec_helper'

describe Timeline do
  let(:repository) { mock(:feed) }

  before do
    feed_1 = Feed.new(url: 'http://test1.com', featured_level: 0)
    feed_2 = Feed.new(url: 'http://test2.com', featured_level: 0)
    feed_3 = Feed.new(url: 'http://test3.com', featured_level: 0)
    feed_4 = Feed.new(url: 'http://test4.com', featured_level: 1)
    feed_5 = Feed.new(url: 'http://test1.com', featured_level: 1)
    feed_6 = Feed.new(url: 'http://test2.com', featured_level: 2)
    feed_7 = Feed.new(url: 'http://test3.com', featured_level: 5)

    repository.stub(:all).and_return [feed_1, feed_2, feed_3, feed_4, feed_5, feed_6, feed_7]
    repository.stub(:all).with(featured_level: 0).and_return [feed_1, feed_2, feed_3]
    repository.stub(:all).with(featured_level: 1).and_return [feed_4, feed_5]

    feed_1.stub(:news).and_return([News.new(featured_level: 0), News.new(featured_level: 0)])
    feed_2.stub(:news).and_return([News.new(featured_level: 0)])
    feed_3.stub(:news).and_return([News.new(featured_level: 0)])
    feed_4.stub(:news).and_return([News.new(featured_level: 1)])
    feed_5.stub(:news).and_return([News.new(featured_level: 1)])
    feed_6.stub(:news).and_return([News.new(featured_level: 2)])
    feed_7.stub(:news).and_return([News.new(featured_level: 5)])
  end

  describe "fetching news" do
    subject { Timeline.new(repository) }
    describe "#featured_news" do
      context "when fetching plain news" do
        it { subject.should have(4).featured_news }
      end
      context "when fetching featured news" do
        it { subject.featured_news.each { |n| n.featured_level.should be 0 } }
      end
    end
  end

end
