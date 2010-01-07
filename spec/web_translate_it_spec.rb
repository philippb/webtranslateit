require File.join(File.dirname(__FILE__), 'spec_helper')

module WebTranslateIt
  class I18n
  end
end

describe WebTranslateIt do
  
  before(:each) do
    WebTranslateIt::I18n.stub(:locale => 'en')
    WebTranslateIt::Configuration.const_set("RAILS_ROOT", File.dirname(__FILE__) + '/examples')
    @configuration = WebTranslateIt::Configuration.new
    @file = mock(WebTranslateIt::TranslationFile)
    @file.stub(:fetch => true)
    @configuration.stub(:files => [@file])
    WebTranslateIt::Configuration.stub(:new => @configuration)
    
  end
  
  describe "WebTranslateIt.fetch_translations" do
    it "should fetch the configuration" do
      WebTranslateIt::Configuration.should_receive(:new)
      WebTranslateIt.fetch_translations
    end
  end
end