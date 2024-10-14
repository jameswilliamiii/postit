# frozen_string_literal: true

class Components::FormCard < Components::Base
  def view_template(&block)
    div(class: base_class) { yield }
  end

  def base_class
    "
      w-full max-w-sm p-4 bg-white border border-gray-200 rounded-lg shadowsm:p-6 md:p-8
      dark:bg-gray-800 dark:border-gray-700
    "
  end
end
