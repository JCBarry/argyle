require_relative 'argyle/version'
require_relative 'argyle/configuration'
require_relative 'argyle/engine'

module Argyle
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
