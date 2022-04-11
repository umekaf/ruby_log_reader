# frozen_string_literal: true

RSpec.describe LogReader::ResponseFormatter do
  let(:respon_formatter) { described_class.new(sort_collection) }
  let(:sort_collection) do
    LogReader::SortCollection[
      '/about' => instance_double(LogReader::Aggregator, unique: 1, total: 10),
      '/home' => instance_double(LogReader::Aggregator, unique: 3, total: 20),
      '/contact-us' => instance_double(LogReader::Aggregator, unique: 20, total: 50)
    ]
  end

  describe '#format' do
    subject { respon_formatter.format }

    let(:expected_result) do
      <<~EOF
        Total view by pages:
        /contact-us 50 visits
        /home 20 visits
        /about 10 visits
        Unique views by pages:
        /contact-us 20 unique visits
        /home 3 unique visits
        /about 1 unique visits
      EOF
    end

    it { is_expected.to eq(expected_result) }
  end
end
