# frozen_string_literal: true

require_relative '../../src/data/page'

describe Page do
  subject { described_class.new(path: '/help_page/1') }

  describe '.path' do
    it 'returns the given path' do
      expect(subject.path).to eq('/help_page/1')
    end
  end

  describe '.add_ip_address' do
    it 'adds the ip address to the array' do
      expect(subject.ip_addresses).to eq([])

      subject.add_ip_address('200.017.277.774')
      subject.add_ip_address('200.017.277.773')

      #   add an ip address which is already in the array
      subject.add_ip_address('200.017.277.774')

      expect(subject.ip_addresses).to eq(['200.017.277.774', '200.017.277.773', '200.017.277.774'])
    end
  end

  describe '.total_views' do
    it 'returns the total number of page views' do
      expect(subject.total_views).to eq(0)

      subject.add_ip_address('200.017.277.774')
      subject.add_ip_address('200.017.277.773')
      #   add an ip address which is already in the array
      subject.add_ip_address('200.017.277.774')

      expect(subject.total_views).to eq(3)
    end
  end

  describe '.unique_views' do
    it 'returns the number of unique page views' do
      expect(subject.unique_views).to eq(0)

      subject.add_ip_address('200.017.277.774')
      subject.add_ip_address('200.017.277.773')
      #   add an ip address which is already in the array
      subject.add_ip_address('200.017.277.774')

      expect(subject.unique_views).to eq(2)
    end
  end
end
