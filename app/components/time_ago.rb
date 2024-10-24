# frozen_string_literal: true

class Components::TimeAgo < Components::Base
  include Phlex::Rails::Helpers::TimeAgoInWords

  def initialize(time:, **options)
    @time = time
    @options = options || {}
    @prefix = @options.delete(:prefix)
    @suffix  = @options.delete(:suffix) || "ago"
  end

  def view_template
    Rails.logger.info("TimeAgo joined_text: #{joined_text}")
    div(**wrpper_attrs) {
      joined_text
    }
  end

  def wrpper_attrs
    klass = [ default_attrs.delete(:class), @options[:class] ].compact.join(" ")
    default_attrs.merge(class: klass)
  end

  def default_attrs
    {
      class: "text-sm text-gray-500 dark:text-gray-400"
    }
  end

  def joined_text
    [
      @prefix,
      time_ago_in_words(@time),
      @suffix
    ].compact.join(" ")
  end
end
