class ApplicationController < ActionController::Base
  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Use the Phlex application layout instead of rails erb version.
  layout -> { ApplicationLayout }
end
