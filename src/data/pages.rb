# frozen_string_literal: true

require 'forwardable'
require_relative 'page'

class Pages
  extend Forwardable

  def_delegators :pages, :size

  def initialize
    @pages = {}
  end

  def add_page(path:, ip_address:)
    pages[path] = Page.new(path:) unless pages.key?(path)

    pages[path].add_ip_address(ip_address:)
  end

  def by_total_views
    pages.values.sort_by(&:total_views).reverse
  end

  def by_unique_views
    pages.values.sort_by(&:unique_views).reverse
  end

  private

  attr_reader :pages
end
