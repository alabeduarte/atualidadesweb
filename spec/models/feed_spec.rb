require 'spec_helper'

describe Feed do
  let(:feed) { Feed.new(
                        url: 'http://somenews.com',
                        selector: '#news',
                        url_pattern: 'a',
                        title: '.title',
                        subtitle: '.subtitle',
                        image_source: 'img',
                        host: 'http://somenews.com',
                        featured_level: 0,
                        limit: 5) }
  describe "#save" do
    it { feed.save.should be_true }
  end

  describe "validations" do
    shared_examples_for "feed valid" do
      it { feed.should be_valid }
    end

    shared_examples_for "feed invalid" do
      it { feed.should_not be_valid }
    end

    describe "#url" do
      context "when it is empty" do
        before { feed.url = nil }
        it_behaves_like "feed invalid"
      end

      context "when address without 'www'" do
        before { feed.url = 'http://myhost.com' }
        it_behaves_like "feed valid"
      end

      context "when address with 'www'" do
        before { feed.url = 'http://www.myhost.com' }
        it_behaves_like "feed valid"
      end

      context "when address is plain text" do
        before { feed.url = 'blabla' }
        it_behaves_like "feed invalid"
      end
    end

    describe "#host" do
      context "when it is empty" do
        before { feed.host = nil }
        it_behaves_like "feed invalid"
      end

      context "when address without 'www'" do
        before { feed.host = 'http://myhost.com' }
        it_behaves_like "feed valid"
      end

      context "when address with 'www'" do
        before { feed.host = 'http://www.myhost.com' }
        it_behaves_like "feed valid"
      end

      context "when address is plain text" do
        before { feed.host = 'blabla' }
        it_behaves_like "feed invalid"
      end
    end

    describe "#selector" do
      context "when it is empty" do
        before { feed.selector = nil }
        it_behaves_like "feed invalid"
      end
    end

    describe "#url_pattern" do
      context "when it is empty" do
        before { feed.url_pattern = nil }
        it_behaves_like "feed invalid"
      end
    end

    describe "#title" do
      context "when it is empty" do
        before { feed.title = nil }
        it_behaves_like "feed valid"
      end
    end

    describe "#featured level" do
      context "when it is empty" do
        before { feed.featured_level = nil }
        it_behaves_like "feed invalid"
      end

      context "when numeric value" do
        before { feed.featured_level = 0 }
        it_behaves_like "feed valid"
      end

      context "when non numeric value" do
        before { feed.featured_level = 'not a number' }
        it_behaves_like "feed invalid"
      end
    end

    describe "#limit" do
      context "when it is empty" do
        before { feed.limit = nil }
        it_behaves_like "feed invalid"
      end

      context "when numeric value" do
        before { feed.limit = 10 }
        it_behaves_like "feed valid"
      end

      context "when non numeric value" do
        before { feed.limit = 'not a number' }
        it_behaves_like "feed invalid"
      end
    end

    describe "#subtitle" do
      context "when it is empty" do
        before { feed.subtitle = nil }
        it_behaves_like "feed valid"
      end
    end

    describe "#image_source" do
      context "when it is empty" do
        before { feed.image_source = nil }
        it_behaves_like "feed valid"
      end
    end
  end

  describe ".all" do
    before { 3.times { create(:feed) } }
    context "when search by some featured level" do
      let(:feeds) { feeds = Feed.all }
      it { feeds.size.should == 3 }
    end
  end

end
