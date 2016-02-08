module Ecm::Tags
  class Tagging < ActsAsTaggableOn::Tagging
    def human
      "#{taggable} - #{tag}"
    end
  end
end