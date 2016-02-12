module Ecm::Tags
  class TagSearch
    include ActiveModel::Model

    attr_accessor :tag_list, :result, :taggable_classes, :fuzzy

    def self.call(*args)
      new(*args).do_work
    end

    def do_work
      say "#{self.class.name} running..."
      output = result
      output.each do |klass, resources|
        say "Found #{resources.size} #{klass.constantize.model_name.human(count: :other)}:", indent: 1
        say resources.inspect, indent: 2
      end
      say "done"
      output
    end

    def tag_list
      @tag_list ||= String.new
    end

    def result
      @result ||= search
    end

    def result!
      @result = nil
      result
    end

    def taggable_classes
      @taggable_classes ||= Ecm::Tags::Tagging.uniq.pluck(:taggable_type)
    end

    def fuzzy
      @fuzzy ||= false
    end

    def fuzzy=(value)
      @fuzzy = ActiveRecord::Type::Boolean.new.type_cast_from_database(value)
    end

    private

    def say(what, options = {})
      options.reverse_merge!(indent: 0)
      indent = options.delete(:indent)

      puts "#{' ' * indent * 2}#{what}"
    end

    def wild
      @wild ||= fuzzy
    end

    def any
      @any ||= fuzzy
    end

    def search
      taggable_classes.each_with_object({}) { |klass, result| result[klass] = klass.constantize.tagged_with(tag_list.split(', '), any: any, wild: wild)  }
    end
  end
end