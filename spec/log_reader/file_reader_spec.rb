# frozen_string_literal: true

RSpec.describe LogReader::FileReader do
  let(:reader) { described_class.new(path) }
  let(:path) { File.expand_path('fixtures/sample.log', __dir__) }

  describe '#file_lines' do
    subject(:file_lines) { reader.file_lines }

    let(:expected_result) { ['home 1', 'about 2', 'services 3', 'contact 4'] }

    it { is_expected.to eq(expected_result) }

    context 'when the file is missing' do
      let(:path) { 'missing.log' }

      it 'raises an error' do
        expect { file_lines }.to raise_error(LogReader::Error)
      end
    end
  end
end
