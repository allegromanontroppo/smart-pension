# frozen_string_literal: true

require 'forwardable'

class Page
  extend Forwardable

  def_delegator :ip_addresses, :push, :add_ip_address
  attr_reader :path, :ip_addresses

  def initialize(path:)
    @path = path
    @ip_addresses = []
  end

  def total_views
    ip_addresses.length
  end

  def unique_views
    ip_addresses.uniq.length
  end
end
