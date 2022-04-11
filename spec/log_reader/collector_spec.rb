# frozen_string_literal: true

RSpec.describe LogReader::Collector do
  let(:collector) { described_class.new(contents) }

  let(:contents)  do
    [
      LogReader::LineContentSegregator.new('/help_page/1', '126.318.035.038'),
      LogReader::LineContentSegregator.new('/contact', '126.318.035.038'),
      LogReader::LineContentSegregator.new('/home', '126.318.035.038'),
      LogReader::LineContentSegregator.new('/help_page/1', '126.318.035.038')
    ]
  end

  describe '#group' do
    subject(:group) { collector.group }

    let(:expected_keys) { ['/help_page/1', '/contact', '/home'] }

    it 'groups entries by their corresponding path' do
      expect(group.keys).to match_array(expected_keys)
    end

    it 'stores total view for each server' do
      expect(group.fetch('/help_page/1').total).to eq(2)
    end
  end
end
