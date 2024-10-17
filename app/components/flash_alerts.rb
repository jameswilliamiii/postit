# frozen_string_literal: true

class Components::FlashAlerts < Components::Base
  attr_reader :flash

  def initialize(flash)
    @flash = flash
  end
  def view_template
    flash.keys.each do |key|
      variant = find_variant(key)

      render RBUI::Alert.new(variant: variant, class: find_alert_class(variant), data: { controller: "flash-alerts" }) do
        div(class: "w-5 inline-block me-2") { render find_icon(variant) }
        render RBUI::AlertDescription.new { flash[key] }
      end
    end
  end

  def find_variant(key)
    case key
    when "notice"
      :success
    when "alert"
      :destructive
    end
  end

  def find_icon(variant)
    case variant
    when :success
      InlineSvg.new("check-circle.svg")
    when :destructive
      InlineSvg.new("exclamation-circle.svg")
    else
      InlineSvg.new("information-circle.svg")
    end
  end

  def find_alert_class(variant)
    base_class = "flex items-center mb-3 opacity-100 max-h-full transition-all ease-in-out duration-700 overflow-hidden"
    case variant
    when :success
      [ base_class, "text-primary ring-primary/20" ].join(" ")
    when :destructive
      [ base_class, "text-red-500 ring-red-500/20" ].join(" ")
    else
      [ base_class, "text-gray-500 ring-gray-500/20" ].join(" ")
    end
  end
end
