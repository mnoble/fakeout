module Fakeout
  class << self; attr_accessor :stdout, :stderr end

  def self.activate!
    $stdout    = @stdout = StringIO.new
    $stderr    = @stderr = StringIO.new
    @is_active = true
  end

  def self.deactivate!
    $stdout    = STDOUT
    $stderr    = STDERR
    @is_active = false
  end

  def self.is_active?
    !!@is_active
  end
end
