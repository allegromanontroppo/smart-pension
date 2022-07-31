# frozen_string_literal: true

require_relative '../../src/data/page'

require_relative '../../src/data/pages'

require_relative '../../src/files/log_file_reader'

require_relative '../../src/files/log_file_parser'

describe LogFileParser do
  subject { described_class.new(log_file_path: 'LOG_FILE_PATH') }

  describe '.log_data' do
    let(:log_file_reader) { double(:log_file_reader, { read: file_contents }) }

    before do
      expect(LogFileReader).to receive(:new).with(log_file_path: 'LOG_FILE_PATH').and_return(log_file_reader)
    end

    context 'populated file' do
      let(:file_contents) do
        [
          '/help_page/1 929.398.951.889',
          '/index 444.701.448.104',
          '/help_page/1 722.247.931.582',
          '/about 061.945.150.735'
        ]
      end

      it "should return the file's contents" do
        expect(subject.log_data).to be_an(Pages)

        expect(subject.log_data.size).to be(3)
      end
    end

    context 'empty file' do
      let(:file_contents) { [] }

      it "should return the file's contents" do
        expect(subject.log_data.size).to be(0)
      end
    end
  end
end
