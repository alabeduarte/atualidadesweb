require 'spec_helper'

describe NewsUpdater do
  before(:each) { Rails.cache.clear }

  describe "#update_by" do
    let(:feed) { mock(:feed) }
    let(:crawler) { mock(:crawler) }
    before do
      news = []
      10.times {|n| news << mock(:news)}
      NewsCrawler.stub(:new).with(anything).and_return(crawler)
      crawler.stub(:news).and_return(news)
    end
    context "when fetch news from feed" do
      it { subject.update_by('feed', [feed]).should have(10).items }
    end
  end
end
