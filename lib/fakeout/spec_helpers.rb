module Fakeout
  module SpecHelpers
    include TestHelpers

    def self.extended(spec)
      spec.fakeout(spec)
    end

    def self.included(spec)
      spec.extend(self)
    end

    def fakeout(spec)
      spec.before { Fakeout.activate! }
      spec.after  { Fakeout.deactivate! }
    end
  end
end