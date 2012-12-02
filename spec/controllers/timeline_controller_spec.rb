require 'spec_helper'

describe TimelineController do

  let(:timeline) { mock(:timeline) }

  describe "GET 'index'" do
    context "success" do
      before do
        Timeline.stub(:new) { timeline }
        get 'index'
      end
      it { response.should be_success }
      it { assigns(:timeline).should == timeline }
    end
  end
end
