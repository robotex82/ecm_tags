module Ecm
  module Tags
    module ApplicationHelper
      def tags_search_box
        @tag_search ||= Ecm::Tags::TagSearch.new
        render partial: 'ecm/tags/search_box'
      end
    end
  end
end
