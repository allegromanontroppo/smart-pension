# frozen_string_literal: true

require_relative '../../src/files/log_file_reader'

describe LogFileReader do
  subject { described_class.new(log_file_path: 'LOG_FILE_PATH') }

  describe '.read' do
    let(:log_file_reader) { double(:log_file_reader, { read: 'FILE_CONTENTS' }) }

    it "should return the file's contents as an array of lines" do
      file = double(:file, readlines: ['  line 1  ', '  line 2', 'line 3  '])

      allow(File).to receive(:open).with('LOG_FILE_PATH').and_yield(file)

      expect(subject.read).to eq(['line 1', 'line 2', 'line 3'])
    end
  end
end
