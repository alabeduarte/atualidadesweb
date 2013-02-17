require 'spec_helper'

describe Feed do
  subject { Feed.new(
                        url: 'http://somenews.com',
                        selector: '#news',
                        url_pattern: 'a',
                        title: '.title',
                        subtitle: '.subtitle',
                        image_source: 'img',
                        host: 'http://somenews.com',
                        featured_level: 0,
                        limit: 5) }

  let(:news) { create(:news) }

  describe "#save" do
    it { subject.save.should be_true }
  end

  context 'associations' do
    it "should has many news" do
      feed = news.feed
      feed.news.first.should == news
    end
  end

  describe "validations" do
    it { should validate_presence_of :selector }
    it { should validate_presence_of :url_pattern }
    it { should validate_presence_of :url }
    it { should validate_presence_of :host }
    it { should validate_presence_of :featured_level }
    it { should validate_presence_of :limit }

    it { should allow_value("http://myhost.com").for(:url) }
    it { should allow_value("http://www.myhost.com").for(:url) }
    it { should_not allow_value("blabla").for(:url) }
    it { should_not allow_value(nil).for(:url) }

    it { should allow_value("http://myhost.com").for(:host) }
    it { should allow_value("http://www.myhost.com").for(:host) }
    it { should_not allow_value("blabla").for(:host) }
    it { should_not allow_value(nil).for(:host) }

    it { should allow_value(0).for(:featured_level) }
    it { should_not allow_value("not a number").for(:featured_level) }
    it { should_not allow_value(nil).for(:featured_level) }

    it { should allow_value(10).for(:limit) }
    it { should_not allow_value("not a number").for(:limit) }
    it { should_not allow_value(nil).for(:limit) }
  end

  describe ".all" do
    before { 3.times { create(:feed) } }
    context "when search by some featured level" do
      let(:feeds) { feeds = Feed.all }
      it { feeds.size.should == 3 }
    end
  end

end
