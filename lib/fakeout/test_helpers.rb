require "fakeout"

module Fakeout
  module TestHelpers
    def stdout
      Fakeout.stdout.string
    end

    def stderr
      Fakeout.stderr.string
    end
  end
end