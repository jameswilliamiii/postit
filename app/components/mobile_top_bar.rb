# frozen_string_literal: true

class Components::MobileTopBar < Components::Base
  attr_reader :options

  def initialize(options = {})
    @options = options
  end

  def view_template(&block)
    nav(class: base_class, **options) {
      yield
    }
  end

  def link_class
    "w-10 h-10 p-1"
  end

  def base_class
    [
      "mobile top-bar md:hidden fixed flex w-full px-4 py-2 items-center justify-start bg-primary top-0 text-white dark:text-black z-50",
      options.delete(:class)
  ].compact.join(" ")
  end
end
