require 'spec_helper'

describe SlideShare do
  before(:each) do
    SlideShare.API_KEY = "IUKyhLLC"
    SlideShare.SECRET = "PdZ8enD1"
  end

  describe "get slideshows by user" do
    before(:each) do
      @talks = SlideShare.get_slideshows_by_user("RookieOne")
    end

    it { @talks.should_not be_empty }
  end

  describe "get slideshow by URL" do
    before(:each) do
      @slideshow = SlideShare.get_slideshow("http://www.slideshare.net/RookieOne/vim-week")
    end

    it { @slideshow.should_not be_empty }
    it { @slideshow['Slideshow']['Title'].should == 'Vim week' }
  end

  describe "get slideshow doc by URL" do
    before(:each) do
      @res = SlideShare.get_slideshow_doc("http://www.slideshare.net/RookieOne/vim-week")
    end

    it { @res.should_not be_empty }
    it { @res.should == 'vimweek-110906213706-phpapp01' }
  end

end
