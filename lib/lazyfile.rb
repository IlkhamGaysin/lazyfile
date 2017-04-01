class Lazyfile
  VERSION = "0.1.0".freeze

  module Helper
    def with_lazyfiles(&block)
      args_number = block.arity.abs

      lazyfiles = Array.new(args_number) { Lazyfile.new }

      begin
        yield(*lazyfiles)
      ensure
        lazyfiles.each(&:destroy)
      end
    end
  end

  def initialize(name = "mediapeers")
    @name = name
  end

  def method_missing(method, *args, &block)
    @file ||= Tempfile.new(@name)

    @file.public_send(method, *args)
  end

  def respond_to_missing?(method, include_private = false)
    Tempfile.public_method_defined? method
  end

  def destroy
    return false unless instance_variable_defined?("@file")

    @file.close!
  end

  def to_s
    "I'm #{@name}"
  end
end
