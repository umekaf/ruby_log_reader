# frozen_string_literal: true

module LogReader
  class CollectionSortor < Hash
    def sort_by_total_views
      sort_by { |_, views| -views.total }
    end

    def sort_by_uniq_view
      sort_by { |_, views| -views.unique }
    end
  end
end
