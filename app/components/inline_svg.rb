# frozen_string_literal: true

class Components::InlineSvg < Components::Base
  def initialize(filepath)
    @filepath = filepath
  end

  def svg_data
    raw(
      Rails.application.assets.load_path.find(@filepath).content.html_safe
    )
  end

  def view_template
    safe(svg_data)
  end
end
