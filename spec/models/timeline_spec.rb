require 'spec_helper'

describe Timeline do
  let(:repository) { mock(:feed) }
  let(:crawler) { mock(:crawler) }

  before do
    feed = Feed.new(url: 'http://test.com', featured_level: 0)

    repository.stub(:all).and_return [feed]
    NewsCrawler.stub(:new).with(anything).and_return(crawler)
    crawler.stub(:news).and_return([News.new(featured_level: 0), News.new(featured_level: 0)])
  end

  describe "fetching news" do
    subject { Timeline.new(repository, NewsUpdater.new) }
    describe "#featured_news" do
      context "when fetching featured news" do
        it { subject.should have(2).featured_news }
      end
    end
  end

end
