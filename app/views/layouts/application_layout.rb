# frozen_string_literal: true

class ApplicationLayout < ApplicationView
  include Phlex::Rails::Layout

  def view_template(&block)
    doctype

    html do
      head do
        title { yield(:title) || "PostIt" }
        meta name: "viewport", content: "width=device-width,initial-scale=1"
        meta name: "apple-mobile-web-app-capable", content: "yes"
        meta name: "mobile-web-app-capable", content: "yes"

        if helpers.authenticated?
          meta name: "current-user-id", content: "<%= current_user.id %>"
        end

        csrf_meta_tags
        csp_meta_tag

        yield :head

        # Enable PWA manifest for installable apps (make sure to enable in config/routes.rb too!)
        # tag.link rel: "manifest", href: pwa_manifest_path(format: :json)

        link rel: "icon", href: "/icon.png", type: "image/png"
        link rel: "icon", href: "/icon.svg", type: "image/svg+xml"
        link rel: "apple-touch-icon", href: "/icon.png"

        # Includes all stylesheet files in app/views/stylesheets
        stylesheet_link_tag :app, "data-turbo-track": "reload"
        javascript_include_tag "application", "data-turbo-track": "reload", type: "module"
      end

      body do
        main(&block)
      end
    end
  end
end