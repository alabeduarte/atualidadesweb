require 'spec_helper'

describe NewsUpdater do
  before(:each) { Rails.cache.clear }

  describe "#update_by" do
    let(:feed) { mock(:feed) }
    before do
      news = []
      10.times {|n| news << mock(:news)}
      feed.stub(:news).and_return(news)
    end
    context "when fetch news from feed" do
      it { subject.update_by('feed', [feed]).should have(10).items }
    end
  end
end
