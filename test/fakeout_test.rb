require "test/unit"
$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '..', 'lib')
require "fakeout"
require "fakeout/test_helpers"

class FakeoutTest < Test::Unit::TestCase
  include Fakeout::TestHelpers

  def setup
    Fakeout.activate!
  end

  def teardown
    Fakeout.deactivate!
  end

  def test_responds_to_stdout
    assert self.respond_to?(:stdout)
  end

  def test_responds_to_stderr
    assert self.respond_to?(:stderr)
  end
  
  def test_captures_output_to_stdout
    puts "is this thing on?"
    assert_match("is this thing on?", stdout)
  end
  
  def test_captures_output_to_stderr
    $stderr.puts "NOPE"
    assert_match("NOPE", stderr)
  end
end
