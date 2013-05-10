require 'spec_helper'

describe TimelineController do

  let(:timeline) { mock(:timeline) }

  describe "GET 'index'" do
    context "success" do
      before do
        timeline.stub(:featured_news) { [] }
        Timeline.stub(:new) { timeline }
        get 'index'
      end
      it { response.should be_success }
      it { assigns(:news).should == timeline.featured_news }
    end
  end
end
