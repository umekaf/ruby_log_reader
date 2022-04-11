# frozen_string_literal: true

RSpec.describe LogReader::SortCollection do
  let(:result) { described_class[grouped_entries] }
  let(:grouped_entries) do
    {
      '/about' => aggregator1,
      '/home' => aggregator2,
      '/contact-us' => aggregator3
    }
  end
  let(:aggregator1) { instance_double(LogReader::Aggregator, unique: 5, total: 5) }
  let(:aggregator2) { instance_double(LogReader::Aggregator, unique: 10, total: 25) }
  let(:aggregator3) { instance_double(LogReader::Aggregator, unique: 2, total: 150) }

  describe '#sort_by_total_views' do
    subject { result.sort_by_total_views }

    let(:expected_sorted_entries) do
      [
        ['/contact-us', aggregator3],
        ['/home', aggregator2],
        ['/about', aggregator1]
      ]
    end

    it { is_expected.to eq(expected_sorted_entries) }
  end

  describe '#sort_by_uniq_view  ' do
    subject { result.sort_by_uniq_view }

    let(:expected_sorted_entries) do
      [
        ['/home', aggregator2],
        ['/about', aggregator1],
        ['/contact-us', aggregator3]
      ]
    end

    it { is_expected.to eq(expected_sorted_entries) }
  end
end
