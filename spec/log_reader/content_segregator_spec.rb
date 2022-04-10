# frozen_string_literal: true

RSpec.describe LogReader::ContentSegregator do
  let(:content_segregator) { described_class.new(file_lines) }
  let(:file_lines) do
    [
      '/help_page/1 126.318.035.038',
      '/contact 184.123.665.067',
      '/home 184.123.665.067',
      '/about/2 444.701.448.104'
    ]
  end

  describe '#segregate' do
    subject(:segregate) { content_segregator.segregate }

    let(:expected_result) do
      [
        LogReader::LineContentSegregator.new('/help_page/1', '126.318.035.038'),
        LogReader::LineContentSegregator.new('/contact', '184.123.665.067'),
        LogReader::LineContentSegregator.new('/home', '184.123.665.067'),
        LogReader::LineContentSegregator.new('/about/2', '444.701.448.104')
      ]
    end

    it { is_expected.to eq(expected_result) }
  end
end
