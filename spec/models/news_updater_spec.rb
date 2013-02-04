require 'spec_helper'

describe NewsUpdater do
  before(:each) { Rails.cache.clear }

  describe "#update_by" do
    let(:feed) { mock(:feed) }
    it "should verify cache before update" do
      Cache.should_receive(:fetch).with(key: 'featured')
      subject.update_by([feed, feed, feed])
    end
    it "should clean up the each one old news" do
      News.should_receive(:destroy_old_news).exactly(1).times
      subject.update_by([feed, feed, feed])
    end
    it "should call the crawler for each feed" do
      NewsCrawler.should_receive(:new).with(feed).exactly(3).times
      subject.update_by([feed, feed, feed])
    end
  end
end
