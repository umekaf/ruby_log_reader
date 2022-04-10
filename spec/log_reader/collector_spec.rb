# frozen_string_literal: true

RSpec.describe LogReader::Collector do
  let(:collector) { described_class.new(content)}

  let(:content){
    [
      LogReader::LineContentSegregator.new('/help_page/1', '126.318.035.038'),
      LogReader::LineContentSegregator.new('/contact', '126.318.035.038'),
      LogReader::LineContentSegregator.new('/home', '126.318.035.038'),
      LogReader::LineContentSegregator.new('/help_page/1', '126.318.035.038')
    ]
  }

  describe '#group' do
    subject(:group) { collector.group }
    let(:expected_keys) { ['/help_page/1', '/contact', '/home'] }

    it 'groups entries by their corresponding path' do
      expec(group.keys).to match__array(expected_keys)
    end

    it 'stores total view for each server' do
      
    end
  end
end