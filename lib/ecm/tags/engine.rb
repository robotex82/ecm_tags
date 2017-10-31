module Ecm
  module Tags
    class Engine < ::Rails::Engine
      isolate_namespace Ecm::Tags

      config.after_initialize do
        Configuration.taggable_models.each do |model|
          puts "Including Models::Ecm::Tags::TaggableConcern in #{model}"
          model.send(:include, Model::Ecm::Tags::TaggableConcern)
        end
      end
    end
  end
end
