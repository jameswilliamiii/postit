# frozen_string_literal: true

class Components::Sessions::New < Components::Base
  include Phlex::Rails::Helpers::FormWith
  include Components::Forms::Inputable

  def view_template
    render Components::FormCard do
      form_with url: session_url, class: "space-y-6" do |form|
        h1(class: "font-bold text-2xl") { "Sign in" }
        div {
          floating_label_input(form, :email_address, :email_field, required: true)
        }
        div {
          floating_label_input(form, :password, :password_field, required: true)
        }
        div {
          RBUI::Link(href: new_password_path, class: "px-0") { "Forgot password?" }
        }
        div {
          render Components::Forms::Submit.new { "Sign into your account" }
        }
        div(class: "mt-4 flex items-center") {
          RBUI::TypographyMuted() { "Not signed up yet?" }
          RBUI::Link(href: "#") { "Create account" }
        }
      end
    end
  end
end
