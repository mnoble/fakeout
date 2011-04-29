require "rspec"
$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '..', 'lib')
require "fakeout"
require "fakeout/spec_helpers"

describe Fakeout do
  before { Fakeout.activate! }
  after  { Fakeout.deactivate! }

  it { should respond_to :activate! }
  it { should respond_to :deactivate! }
  it { should respond_to :is_active? }

  it "should be active when activated" do
    Fakeout.should be_is_active
  end
  
  it "should be inactive when deactivated" do
    Fakeout.deactivate!
    Fakeout.should_not be_is_active
  end

  describe ".activate!" do
    it "should make $stdout a StringIO object" do
      $stdout.should be_a StringIO
    end

    it "should make $stderr a StringIO object" do
      $stderr.should be_a StringIO
    end
  end
  
  describe ".deactivate!" do
    before do 
      Fakeout.activate!
      Fakeout.deactivate!
    end

    it "should put back the original $stdout" do
      $stdout.should_not be_a StringIO
    end

    it "should put back the original $stderr" do
      $stderr.should_not be_a StringIO
    end
  end
  
  describe "spec_helpers" do
    include Fakeout::SpecHelpers
    subject { self }

    it { should respond_to :stdout }
    it { should respond_to :stderr }

    it "should capture output to stdout" do
      puts "omg output!"
      stdout.should include "omg output!"
    end

    it "should capture output into stderr" do
      $stderr.puts "errorz zomg!"
      stderr.should include "errorz zomg!"
    end
  end
end