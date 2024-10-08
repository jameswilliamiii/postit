class ApplicationController < ActionController::Base
  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  # TODO: Turn on after styling is complete.
  # allow_browser versions: :modern
end
