require "lazyfile/version"

module Lazyfile
  module Helper
    def with_lazyfiles(&block)
      block.call
    end
  end
end

