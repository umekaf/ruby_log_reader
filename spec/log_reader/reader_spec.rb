# frozen_string_literal: true

RSpec.describe LogReader::Reader do
  let(:reader) { described_class.new('test/file') }

  describe '#format' do
    subject { reader.format }

    let(:file_reader) do
      instance_double(LogReader::FileReader,
                      file_lines: ['/about/2 444.701.448.104', '/home 235.313.352.950'])
    end

    before do
      allow(LogReader::FileReader).to receive(:new).with('test/file').and_return(file_reader)
    end

    it { is_expected.to include('Total view by pages') }
  end
end
