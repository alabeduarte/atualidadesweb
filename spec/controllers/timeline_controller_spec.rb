require 'spec_helper'

describe TimelineController do

  let(:timeline) { mock(:timeline) }

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end

    it "should fetch featured news" do
       Timeline.stub(:new) { timeline }
       get 'index'
       assigns(:timeline).should == timeline
    end
  end

end
