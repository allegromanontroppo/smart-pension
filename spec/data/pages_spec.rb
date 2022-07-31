# frozen_string_literal: true

require_relative '../../src/data/pages'
require_relative '../../src/data/page'

describe Pages do
  subject { described_class.new }

  describe '.add_page' do
    it 'adds the page' do
      page = double(:page)

      expect(Page).to receive(:new).with(path: '/help_page/1').and_return(page)
      expect(page).to receive(:add_ip_address).with(ip_address: '929.398.951.889')

      subject.add_page(path: '/help_page/1', ip_address: '929.398.951.889')
    end
  end
end
