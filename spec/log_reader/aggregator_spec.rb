# frozen_string_literal: true

RSpec.describe LogReader::Aggregator do
  let(:aggregator) { described_class.new }

  describe '#call' do
    subject(:request) { aggregator.call(line_content) }

    let(:line_content) { LogReader::LineContentSegregator.new('/about/1', '126.318.035.038') }

    it 'increments total view on the page' do
      expect { request }.to change(aggregator, :total).by(1)
    end

    it 'increments uniq view on the page' do
      expect { request }.to change(aggregator, :unique).by(1)
    end

    context 'when the ip already exist' do
      before do
        aggregator.ips['126.318.035.038'] = true
      end

      it 'does not increment the uniq view cout' do
        expect { request }.not_to change(aggregator, :unique)
      end
    end
  end
end
