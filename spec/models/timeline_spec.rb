require 'spec_helper'

describe Timeline do
  #   before(:all) do
  #     3.times {|n| create(:news_feed)}
  #   end

  xit "should organize timeline by news feed" do
    Timeline.all.size.should == 3
  end
end
